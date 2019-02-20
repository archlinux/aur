# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
pkgname=tmux-resurrect-git
_pkgname=tmux-resurrect
pkgver=2.4.0.r93.gc3ffe89
pkgrel=1
pkgdesc="Persist tmux environment across system restarts."
arch=('any')
url='https://github.com/tmux-plugins/tmux-resurrect'
install=tmux-resurrect.install
license=('MIT')
depends=('tmux' 'bash')
optdepends=('expect: restore.exp script that fully restores tmux environment')
makedepends=('git')
source=("git+https://github.com/tmux-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed 's|~/.tmux/plugins/tmux-resurrect|/usr/share/tmux-resurrect-git|' -i scripts/restore.exp
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir "${pkgdir}/usr/share/${pkgname}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"
  rm -r "${pkgdir}/usr/share/${pkgname}/"{LICENSE.md,lib,run_tests,tests,video}
}
