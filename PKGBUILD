# Maintainer: KawaiDesu
pkgname=gaspass
pkgver=0.1.1
pkgrel=1
pkgdesc="Not a password manager"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/KawaiDesu/gaspass"
license=('MIT')
makedepends=('go-pie>=1.11')
source=(https://github.com/KawaiDesu/gaspass/archive/${pkgver}.tar.gz)
sha256sums=('e0aabc0ab75c708e2a13bdb6478f04e9f71f6638a1374dae2879586fd2dcbb1c')

build(){
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}"
# Waiting for go 1.13 release
#    -gcflags "all=-trimpath=${PWD};${GOPATH}" \
#    -asmflags "all=-trimpath=${PWD};${GOPATH}" \
#    -ldflags "-extldflags ${LDFLAGS}"
}

package(){
  install -Dm755 "${pkgname}-${pkgver}/gaspass" "${pkgdir}/usr/bin/gaspass"
}
