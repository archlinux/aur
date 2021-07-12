# Maintainer: André Kugland <kugland@gmail.com>

pkgname=pingme
pkgver=0.2.3
pkgrel=1
pkgdesc='PingMe is a CLI tool which provides the ability to send messages or alerts to multiple messaging platforms & email.'
arch=('x86_64')
url='https://pingme.lmno.pk'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kha7iq/pingme/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c66e8e397c87b8f8a5098ca6a64ee79620d9f16e9287799b0fa77ae3990d4f7')

build() {
    export GOFLAGS="-trimpath"
    cd $pkgname-$pkgver/
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      .    
}

package() {
    cd $pkgname-$pkgver/
    install -Dm755 -t $pkgdir/usr/bin/ pingme
    install -Dm644 -t $pkgdir/usr/share/doc/pingme/ README.md
}
