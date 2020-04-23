# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=moldova
pkgver=2.0.1
pkgrel=1
pkgdesc="A lightweight templating system for generating random data"
arch=('x86_64')
url='https://github.com/StabbyCutyou/moldova'
license=('Apache-2.0')
makedepends=('dep' 'go-pie')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('099f417c638164386760d612426d13329b657531b3d4c9b3dab7f24381e35ebc')

prepare() {
  mkdir -p gopath/src/github.com/${pkgname}
  ln -rTsf ${pkgname}-${pkgver} gopath/src/github.com/${pkgname}/${pkgname}
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname}/${pkgname}
  dep init -v
  dep ensure -v
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname}/${pkgname}/cmd/moldova
  go install -v .
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}