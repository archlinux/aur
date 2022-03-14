# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
# Contributor: nirnakinho <aur at dominikbodi dot de>

pkgname=dnscontrol
pkgver=3.15.0
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL"
arch=('x86_64')
url="https://stackexchange.github.io/${pkgname}/"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
provides=("${pkgname}=${pkgver}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0e9034049222c885d0b3ce335b27aa07085d2f1b7dab11510ec69a934bce28543be8030afb8db609b54f602796e51217894a418467e4f7660eac7d108e32fdf9')

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
