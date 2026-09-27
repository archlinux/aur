# Maintainer: ptrj <aur@dbs.sk>
pkgname=mic-overlay
pkgver=0.2.2
pkgrel=1
url='https://github.com/ptrj/mic-overlay'
pkgdesc='Microphone mute status overlay for KDE Plasma Wayland'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('qt6-base>=6.5' 'qt6-declarative' 'qt6-wayland' 'qt6-svg'
         'layer-shell-qt>=6.6' 'pipewire' 'wireplumber' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2eb00b146b40704783222cec3ce4bc83efef19f553e1892b7c847527f14344c1')

build() {
    cmake -S "$srcdir/$pkgname-$pkgver" -B "$srcdir/build" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=ON
    cmake --build "$srcdir/build"
}

check() {
    ctest --test-dir "$srcdir/build" --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
