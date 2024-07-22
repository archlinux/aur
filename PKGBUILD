# Maintainer: Sergio Carmine <me@sergiocarmi.net>

pkgname=baseic
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple numeric conversion tool'
arch=(x86_64)
url=https://github.com/carmisergio/baseic
license=(MIT)

provides=($pkgname)
conflicts=($pkgname)
depends=(gcc-libs glibc)
makedepends=(git cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/tags/v$pkgver.tar.gz)
sha256sums=('d5bfddf222827cf17687b13a5f578ef1a9a6f6ae30eeaf4321408647c83c8b3e')
options=(!lto)

prepare() {
    cd "$srcdir"/$pkgname-tags-v$pkgver
    cargo update
    cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
    cd "$srcdir"/$pkgname-tags-v$pkgver
    cargo update
    cargo build --frozen --release 
}

check() {
    cd "$srcdir"/$pkgname-tags-v$pkgver
    cargo test --frozen
}

package() {
    cd "$srcdir"/$pkgname-tags-v$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        README.md
}


