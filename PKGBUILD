# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=seer-gdb
pkgver=2.6
pkgrel=1
pkgdesc="A gui frontend to gdb"
arch=('x86_64' 'aarch64')
url="https://github.com/epasveer/seer.git"
license=(GPL-3.0-or-later)
depends=('gcc-libs' 'gdb' 'glibc' 'hicolor-icon-theme'  'qt6-base' 'qt6-charts' 'qt6-svg')
makedepends=('git' 'cmake')
provides=('seergdb')
source=("${pkgname}::git+https://github.com/epasveer/seer.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cmake -B build -S ${pkgname}/src \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
    
    cmake --build build -t seergdb
}

package() {
	DESTDIR="$pkgdir" cmake --install build

        cd "$srcdir/${pkgname}/src/resources"
        install -Dm644 'seergdb_32x32.png' "$pkgdir/usr/share/icons/hicolor/32x32/apps/seergdb.png"
        install -Dm644 'seergdb_64x64.png' "$pkgdir/usr/share/icons/hicolor/64x64/apps/seergdb.png"
        install -Dm644 'seergdb_128x128.png' "$pkgdir/usr/share/icons/hicolor/128x128/apps/seergdb.png"
        install -Dm644 'seergdb_256x256.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/seergdb.png"
        install -Dm644 'seergdb_512x512.png' "$pkgdir/usr/share/icons/hicolor/512x512/apps/seergdb.png"

        install -Dm644 'seergdb.desktop' -t "$pkgdir/usr/share/applications"
}


