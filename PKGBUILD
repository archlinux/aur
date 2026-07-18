# Maintainer: iliarezaei <iliarezaei69@gmail.com>
pkgname=ilicam
pkgver=1.0.1
pkgrel=1
pkgdesc="Professional Camera Application for Linux with Qt6 and OpenCV"
arch=('x86_64')
url="https://github.com/iliarezaei/ilicam"
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-tools'
    'opencv'
    'cmake'
    'gcc'
    'make'
)
makedepends=(
    'qt6-tools'
    'cmake'
    'gcc'
    'make'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/iliarezaei/ilicam/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install

    # نصب فایل .desktop
    install -Dm644 "$srcdir/$pkgname-$pkgver/ilicam.desktop" \
        "$pkgdir/usr/share/applications/ilicam.desktop"
}
