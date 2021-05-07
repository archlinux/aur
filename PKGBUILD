# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol
pkgver=3.8.1
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('71068161af2da15ed3a6e65ff2b66b8ffa4a7b71d49a5024bcffe602160082726a81bf9380f14864477eb906501cdc2254f9b072c8b68b676483919d74026e5d')

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
