# Maintainer: robertfoster
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor:

pkgname=dhewm3
pkgver=1.5.1_RC3
pkgrel=1
pkgdesc="Doom 3 engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/dhewm/dhewm3"
license=('GPL3')
depends=('curl' 'libjpeg' 'libvorbis' 'openal' 'sdl2')
optdepends=('doom3-data')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz"
  "$pkgname.desktop"
  "$pkgname.png"
)
install=$pkgname.install

build() {
  cd "$pkgname-$pkgver/neo"
  cmake -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DREPRODUCIBLE_BUILD=1 \
    -DD3XP=1 \
    -DDEDICATED=1 .
  cmake --build .
}

package() {
  cd "$pkgname-$pkgver/neo"
  DESTDIR="$pkgdir" \
    cmake --install .
  #    make DESTDIR="$pkgdir" libdir="$pkgdir/usr/lib" install
  install -Dm644 ../../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ../base/default.cfg "$pkgdir/usr/share/dhewm3/base/default.cfg"
  install -dm755 "$pkgdir/usr/share/dhewm3/d3xp"
}

md5sums=('7d82ac291dc72e20c428bb0eb1d656ee'
         '300636e2e3ac0566dc6ceb63f121850e'
         '8b834c4c1cd5ccb25b1afe6cb47941a8')
