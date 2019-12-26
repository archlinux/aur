# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ip2geo'
pkgver='1.1.4'
pkgrel='1'
pkgdesc='Import ipgeo data to files for nginx geoip module'
arch=('x86_64' 'i686')
url="https://github.com/m-messiah/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e60d54b2a93771ab60b07cfce77d291bffb49d83123674c57ef90513d9a8341a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/m-messiah"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/github.com/m-messiah/${pkgname}"
  cd ${GOPATH}
  go get -v -x github.com/fatih/color
  go get -v -x github.com/jinzhu/configor
  go get -v -x golang.org/x/net/html/charset  
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/m-messiah/${pkgname}"
  GOOS=linux go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
