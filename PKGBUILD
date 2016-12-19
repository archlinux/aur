# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=gnatsd
pkgver=0.9.6
pkgrel=1
pkgdesc="A simple, high performance open source messaging system for cloud native applications, IoT messaging, and microservices architectures."
arch=('i686' 'x86_64')
url="http://github.com/nats-io/gnatsd"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("gnatsd=${pkgver}")
source=("https://github.com/nats-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('18d6d1b014bfd262da101e15ed914e194b51b47e3e1a8ca4e8743c742d65310c')
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
