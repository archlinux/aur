# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=ffuf
pkgver=1.1.0
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('468963c6bec5390222802ec0b04c11187bb159f369edc2ebba1d228b8faf4f35')

build() {
    cd $pkgname-$pkgver

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags $LDFLAGS" \
        -o $pkgname
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
