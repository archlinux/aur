# Maintainer:

_pkgname=sensible-utils
pkgname="$_pkgname-unified"
pkgver=0.0.20
_debianextra=
pkgrel=3
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
  sensible-utils-data
)
conflicts=(${provides[@]})

source=(
  "https://deb.debian.org/debian/pool/main/s/$_pkgname/${_pkgname}_${pkgver}${_debianextra}.tar.xz"
)
sha256sums=(
  'b8cfd2dd268b3d982cc8e94af573b3e72e7917b2fa6f28eaa5e056ad99212edb'
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
  make -k check | true
}

package() {
  replaces=(
    ${provides[@]}
    sensible-utils
  )
  provides+=(
    sensible-utils
    sensible-utils-unified
  )

  cd "${_pkgname}-${pkgver}${_debianextra}"
  export -n EDITOR VISUAL
  make DESTDIR="$pkgdir/" install
  shopt -s globstar
}
