# Maintainer: wyf9661 <wyf9661 at gmail.com>
# Contributor: zhufuyi <g.zhufuyi@gmail.com>

pkgname=sponge
pkgver=1.13.2
pkgrel=1
pkgdesc="A powerful and easy-to-use Go development framework that enables you to effortlessly build high-performance, highly available backend service systems through a 'low-code' approach."
arch=(any)
url="https://github.com/go-dev-frame/sponge"
license=(MIT)
depends=('glibc')
makedepends=('go')
optdepends=('docker')
source=("$url/archive/v$pkgver/${pkgname}_${pkgver}_linux.zip")
sha1sums=('f5e105d003d22b4b089f7d48af33b8f4fd276e5e')

prepare() {
    mkdir -vp $pkgname-$pkgver/build
}

build() {
    mkdir -vp $pkgname-$pkgver/build
    cd "$pkgname-$pkgver"
    export GOBIN=$PWD/build
    make install
}

package() {
    install -dm755 "$pkgdir/usr/bin/"
    for file in "$srcdir/$pkgname-$pkgver/build"/*; do
        if [ -f "$file" ]; then
            install -Dm755 "$file" -t "$pkgdir/usr/bin/"
        fi
    done
    install -Dm644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
