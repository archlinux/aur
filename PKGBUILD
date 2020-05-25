# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Alexander F Rødseth
# Contributor: Chris Brannon
# Contributor: JJDaNiMoTh
# Contributor: Bjørn Lindeijer

pkgname=dumb-a4
pkgver=2.0.3
pkgrel=1
pkgdesc='IT, XM, S3M and MOD player library (for legacy Allegro 4)'
arch=('x86_64')
license=('custom:dumb' 'GPL')
url='http://dumb.sourceforge.net/'
makedepends=('allegro4' 'cmake' 'ninja')
conflicts=('dumb')
provides=('dumb')
depends=('allegro4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kode54/dumb/archive/$pkgver.tar.gz")
sha256sums=('99bfac926aeb8d476562303312d9f47fd05b43803050cd889b44da34a9b2a4f9')

build() {
    cmake -B build "dumb-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_ALLEGRO4=ON \
        -DBUILD_EXAMPLES=OFF \
        -GNinja

    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "dumb-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
