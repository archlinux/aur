# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Contributor: nirnakinho <aur at dominikbodi dot de>

pkgname=dnscontrol
pkgver=3.24.0
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('17432ec8954828355113d8e7957d86dbef50002fc027fa2f4979fe8be15007670f2ab9c58a11a57578c9d702268022a152f4949a7ef27e580f8acfb7cd691cdb')

prepare(){
  mkdir -p gopath/src/github.com/StackExchange
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/StackExchange/dnscontrol
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd gopath/src/github.com/StackExchange/dnscontrol

  GO111MODULE=on go run build/build.go -os=linux
  go clean -modcache
}

package() {
  install -Dm755 gopath/src/github.com/StackExchange/dnscontrol/${pkgname}-Linux "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 gopath/src/github.com/StackExchange/dnscontrol/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
