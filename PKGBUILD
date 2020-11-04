# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>

pkgname=envypn-powerline-git
_name=envypn-powerline
pkgver=r13.9059e0a
pkgrel=2
pkgdesc="Readable bitmap font inspired by Envy Code R"
url="https://github.com/Sorixelle/envypn-powerline"
arch=('any')
license=('custom')
provides=('envypn-font')
depends=('fontconfig' 'xorg-fonts-encodings')
source=("git+https://github.com/Sorixelle/envypn-powerline")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_name}"
  install -d "${pkgdir}/usr/share/fonts/${_name}"
  install -m644 *.bdf "${pkgdir}/usr/share/fonts/${_name}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
}


