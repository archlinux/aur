# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>
# Contributor: Alexander Kauer <alexander at affine dot space>

pkgname=run_scaled-imfix-git
_gitdir=run_scaled
pkgver=r20.6699934
pkgrel=1
pkgdesc='Run an X application scaled via xpra. Useful on hidpi screens. (Patched for fcitx/fcitx5 support)'
arch=('any')
url='https://github.com/kaueraal/run_scaled'
license=('BSD')
provides=('run_scaled')
conflicts=('run_scaled' 'run_scaled-git')
makedepends=('git')
depends=('xpra' 'xorg-xrandr' 'xorg-server-xvfb' 'bc')
_env=QT_IM_MODULE
optdepends=(
  "manjaro-asian-input-support-fcitx: Fcitx support (Alternatively, set $_env to fcitx manually)"
  "manjaro-asian-input-support-fcitx5: Fcitx5 support (Alternatively, set $_env to fcitx5 manually)"
)
source=("${_gitdir}::git+${url}.git")
md5sums=(SKIP)

prepare() {
  cd "${srcdir}/${_gitdir}"
  sed -i "s/xpra start/xpra start --start=\$$_env --input-method=\$$_env/" run_scaled
}

pkgver() {
  cd "${srcdir}/${_gitdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitdir}"
  install -Dm755 run_scaled "${pkgdir}/usr/bin/run_scaled"
  #install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2 sw=2 et
