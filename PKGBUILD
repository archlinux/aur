# Maintainer: xeruf <27f at pm dot me>

_pkgbasename='pass-clip'
pkgname="${_pkgbasename}-git"
pkgver=0.2.r9.g26a8668
pkgrel=1
pkgdesc='A pass extension to copy passwords to the clipboard using fzf or rofi.'
arch=('any')
url="https://github.com/ibizaman/${_pkgbasename}"
license=('GPL3')
depends=('pass')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
optdepends=('rofi: Use rofi to present choices.'
            'fzf: Use fzf to present choices.')
source=("git+${url}")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgbasename}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}

pkgver() {
  cd "${_pkgbasename}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
