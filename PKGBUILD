# Maintainer: Afnan <hyperafnan@github.com>
pkgname=clean-my-keyboard
pkgver=1.1.0
pkgrel=1
pkgdesc="Temporarily disable keyboard input for cleaning"
arch=('x86_64')
url="https://github.com/HyperAfnan/clean-my-keyboard"
license=('MIT')
depends=('gtk4' 'systemd-libs' 'polkit' 'hicolor-icon-theme')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('63bacdc060c8edd81a6e851a8da65a7da44be6140572f851c905fa414336f98d')

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
