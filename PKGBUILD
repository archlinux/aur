# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=udpme
pkgver=0.2.1
pkgrel=1
pkgdesc="UDP must have EDNS0，从协议层面借助 EDNS0 过滤掉有问题的 UDP 报文"
arch=('x86_64' 'i686')
url="https://github.com/IrineSistiana/udpme"
license=('GPL3')
makedepends=('go')
conflicts=('udpme')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9394c67cee5ac7523691aa93d456602b550077dd0b8249690aabfd1fc8ab72c6')

build(){
    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external"
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
