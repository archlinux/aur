# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=gnatsd
pkgver=1.4.0
pkgrel=0
pkgdesc="A simple, high performance open source messaging system for cloud native applications, IoT messaging, and microservices architectures."
arch=('i686' 'x86_64')
url="http://github.com/nats-io/gnatsd"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("gnatsd=${pkgver}")
source=("https://github.com/nats-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('193778c9c697823d5a198552236fb2f519d509213fbbbea77cd4341719066bfb')
_gourl="github.com/nats-io/${pkgname}"

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  export GOBIN="${srcdir}/bin"
  go get -v ${_gourl}
}

package() {
  install -Dm 775 "${srcdir}/bin/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
