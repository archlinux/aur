# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=seer-gdb
pkgver=1.14
pkgrel=1
pkgdesc="A gui frontend to gdb"
arch=('x86_64' 'aarch64')
url="https://github.com/epasveer/seer.git"
license=('GPL3')
depends=('qt5-base' 'gdb' 'qt5-charts')
makedepends=('git' 'gcc' 'cmake')
provides=('seergdb')
source=("${pkgname}::git+https://github.com/epasveer/seer.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
        cd "$srcdir/${pkgname}/src"
        mkdir -p build; cd build
        cmake \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX='/usr' ..

        make seergdb
}

package() {
	cd "$srcdir/${pkgname}/src/build"
        make install DESTDIR="$pkgdir"

        cd "$srcdir/${pkgname}/src/resources"
        install -Dm644 'seergdb_32x32.png' "$pkgdir/usr/share/icons/hicolor/32x32/apps/seergdb.png"
        install -Dm644 'seergdb_64x64.png' "$pkgdir/usr/share/icons/hicolor/64x64/apps/seergdb.png"
        install -Dm644 'seergdb_128x128.png' "$pkgdir/usr/share/icons/hicolor/128x128/apps/seergdb.png"
        install -Dm644 'seergdb_256x256.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/seergdb.png"
        install -Dm644 'seergdb_512x512.png' "$pkgdir/usr/share/icons/hicolor/512x512/apps/seergdb.png"

        install -Dm644 'seergdb.desktop' -t "$pkgdir/usr/share/applications"
}


