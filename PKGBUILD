# Maintainer:

_pkgname=sensible-utils
pkgbase=sensible-utils-unified
pkgname=("$_pkgname")
pkgver=0.0.17
_debianextra=+nmu1
pkgrel=4
pkgdesc="Utilities for sensible alternative selection (unified)"
arch=('any')
url="https://packages.debian.org/source/sid/sensible-utils"
license=('GPL')
depends=('bash')
makedepends=('po4a')
checkdepends=('ed')

provides=(
  sensible-browser
  sensible-editor
  sensible-pager
  sensible-terminal
  sensible-utils
  sensible-utils-data
)
conflicts=(${provides[@]})

source=(
  "https://deb.debian.org/debian/pool/main/s/$_pkgname/${_pkgname}_${pkgver}${_debianextra}.tar.xz"
)
sha256sums=(
  'a4ead62e0dc8f965453221dcb09c964abc4f1bedad24f527d33c443a1570cb31'
)

build() {
  cd "${_pkgname}-${pkgver}${_debianextra}"
  export -n EDITOR VISUAL
  ./configure --prefix=/usr
  make
}

check() {
  cd "${_pkgname}-${pkgver}${_debianextra}"
  export -n EDITOR VISUAL
  make -k check
}

package() {
  cd "${_pkgname}-${pkgver}${_debianextra}"
  export -n EDITOR VISUAL
  make DESTDIR="$pkgdir/" install
  shopt -s globstar
}
