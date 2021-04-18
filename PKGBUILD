# Maintainer: André Kugland <kugland@gmail.com>

pkgname=pingme
pkgver=0.1.2
pkgrel=1
pkgdesc='PingMe is a CLI tool which provides the ability to send messages or alerts to multiple messaging platforms & email.'
arch=('x86_64')
url='https://pingme.lmno.pk'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kha7iq/pingme/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('57eea904eebaeac355ee7a6324d977678325945730269b4689eac992fb52699e')

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
