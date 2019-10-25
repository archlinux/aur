# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>
pkgname=plasma5-wallpapers-dynamic
pkgver=2.2
pkgrel=2
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/plasma5-wallpapers-dynamic"
license=('GPL')
depends=(plasma-framework qt5-base qt5-declarative)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2fd2ccff27ffd2b7325551cefb7ff1abaf65a539d4d5ac52fa5aec653f253b8d')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install

    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 metadata.json.solar.sample "$pkgdir/usr/share/doc/${pkgname}/metadata.json.solar.sample"
    install -Dm644 metadata.json.timed.sample "$pkgdir/usr/share/doc/${pkgname}/metadata.json.timed.sample"
}
