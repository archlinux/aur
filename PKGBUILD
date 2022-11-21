# Maintainer: zotan <aur@zotan.email>

pkgname=snid
pkgver=0.2.0
pkgrel=1
pkgdesc="SNI-based Proxy Server"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/AGWA/snid"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AGWA/snid/archive/v$pkgver.tar.gz")
sha256sums=('03dfee392b4c9817e3a0fb63d6abf1024b381dc6d92d093c25b8975aba4fce1f')

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$SRCDEST/go-modules"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "$pkgname-$pkgver"
  install -D snid ${pkgdir}/usr/bin/snid
}
