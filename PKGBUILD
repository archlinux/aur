# Maintainer: AdmiringWorm <kim.nordmo@gmail.com>
pkgname=dnscontrol
pkgver=2.9
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL "
arch=('x86_64')
url="https://stackexchange.github.io/${pkgname}/"
license=('GPL')
depends=('glibc')
makedepends=('go-pie')
provides=("${pkgname}=${pkgver}")
source=("https://github.com/StackExchange/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6c3e739b56c64e2e41a0cb23f4debc3db6889aca0a78016c730ef8d1e42709e8')

prepare(){
  mkdir -p gopath/src/github.com/StackExchange
  ln -rTsf $pkgname-$pkgver gopath/src/github.com/StackExchange/dnscontrol
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/StackExchange/dnscontrol

  go build \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags ${LDFLAGS}" \
    -v .
}

package() {
  install -Dm755 gopath/src/github.com/StackExchange/dnscontrol/$pkgname "$pkgdir"/usr/bin/$pkgname
}
