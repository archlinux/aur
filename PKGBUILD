# Maintainer: Afnan <hyperafnan@github.com>
pkgname=clean-my-keyboard
pkgver=1.2.0
pkgrel=1
pkgdesc="Temporarily disable keyboard input for cleaning"
arch=('x86_64')
url="https://github.com/HyperAfnan/clean-my-keyboard"
license=('MIT')
depends=('gtk4' 'polkit' 'hicolor-icon-theme')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ff8517eb699896f86e9f253548483d371576d0493497b0d5b52f70d4bd5fc64')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
