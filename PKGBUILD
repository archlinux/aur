# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ip2geo'
pkgver='1.1.6'
pkgrel='1'
pkgdesc='Import ipgeo data to files for nginx geoip module'
arch=('x86_64' 'i686' 'aarch64')
_uri="github.com/m-messiah"
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('48328309e27bb9a65907ff8a1ef27883bf47bb0bd39feb7e081b91509cae37af')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  go mod download -x
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  GOOS=linux go build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
