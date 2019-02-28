# Maintainer: robertfoster
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: 

pkgname=dhewm3
pkgver=1.5.0
pkgrel=2
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
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DD3XP=1 \
    -DDEDICATED=1 .
    make
}

package() {
    cd "$pkgname-$pkgver/neo"

    make DESTDIR="$pkgdir" libdir="$pkgdir/usr/lib" install
    install -Dm644 ../../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 ../../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

md5sums=('cc770a4e454704405a83d8ea170706e8'
    '300636e2e3ac0566dc6ceb63f121850e'
'8b834c4c1cd5ccb25b1afe6cb47941a8')
