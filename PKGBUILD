# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=ffuf
pkgver=1.0.2
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('018e3aa92d27846eaf55b49a451b2517db1ad65d5d696116ade1fe8bda4535ba')

build() {
    cd "$pkgname-$pkgver"

    go build \
        -trimpath \
        -ldflags="-extldflags $LDFLAGS" \
        -o $pkgname
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
