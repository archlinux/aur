# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>
pkgname=plasma5-wallpapers-dynamic
pkgver=2.7.1
pkgrel=2
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/plasma5-wallpapers-dynamic"
license=('GPL')
depends=(kio plasma-framework qt5-base qt5-declarative qt5-location)
makedepends=(cmake extra-cmake-modules)
optdepends=('geoclue: automatic location detection support')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('441ab62cedc0b95e501e2d14378eaafabb881fa34a971240654e970a8039901e')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install

    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 metadata.json.solar.sample "$pkgdir/usr/share/doc/${pkgname}/metadata.json.solar.sample"
    install -Dm644 metadata.json.timed.sample "$pkgdir/usr/share/doc/${pkgname}/metadata.json.timed.sample"
}
