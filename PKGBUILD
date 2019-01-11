# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ip2geo'
_wrong_ver='1.0.4-1'
pkgver='1.0.4.1'
pkgrel='1'
pkgdesc='Import ipgeo data to files for nginx geoip module'
arch=('x86_64' 'i686')
url="https://github.com/pm-messiah/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${_wrong_ver}.tar.gz")
sha256sums=('10585bcb2de7cef8a063dcacf856a5faddb3676a3f578b5008855a565cd37628')

prepare() {
  cd "${srcdir}/${pkgname}-${_wrong_ver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/m-messiah"
  ln -snf "${srcdir}/${pkgname}-${_wrong_ver}" "${GOPATH}/src/github.com/m-messiah/${pkgname}"
  cd ${GOPATH}
  go get -v -x github.com/fatih/color 
  go get -v -x golang.org/x/net/html/charset
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/m-messiah/${pkgname}"
  GOOS=linux go build
}

package() {
  cd "${srcdir}/${pkgname}-${_wrong_ver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
