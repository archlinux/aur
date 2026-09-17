# Maintainer: fenuks

pkgname=readeck
pkgver=0.23.4
pkgrel=1
pkgdesc='Readeck is a simple web application that lets you save the precious readable content of web pages you like and want to keep forever.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://readeck.org'
_vcs_url='https://codeberg.org/readeck/readeck'
license=('AGPLv3')
depends=()
optdepends=('postgresql: for using PostgreSQL instead of SQLite')
makedepends=(go npm)
# options=(!buildflags)
source=("${pkgname}-${pkgver}.tar.gz::${_vcs_url}/archive/${pkgver}.tar.gz")
sha256sums=('9b4b418c2ed6e0528b5a6808830ee7890f401e06b04c5f9f8762af9932bab9ca')
privides=("${pkgname}")
conflicts=("${pkgname}")

prepare() {
  export GOPATH="${srcdir}/gopath"
  cd "${pkgname}"
  make setup
}

build() {
  export GOPATH="${srcdir}/gopath"
  # workaround for flag provided but not defined: -Wl,--sort-common
  unset LDFLAGS
  cd "${srcdir}/${pkgname}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
