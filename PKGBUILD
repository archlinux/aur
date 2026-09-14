# Maintainer: fenuks

pkgname=readeck
pkgver=0.23.2
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
sha256sums=('1094edb09ebc124526ce4e83d2125bbff1c75a188a302e21f39416dc4ada6182')
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
