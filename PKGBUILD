# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=seer-gdb
pkgver=1.8
pkgrel=1
pkgdesc="A gui frontend to gdb"
arch=('x86_64' 'aarch64')
url="https://github.com/epasveer/seer.git"
license=('GPL3')
depends=('qt5-base' 'gdb' 'qt5-charts')
makedepends=('git' 'gcc' 'cmake')
source=("${pkgname}::git+https://github.com/epasveer/seer.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
        [ ! -d "build" ] && mkdir build
        cmake -S ${pkgname}/src -B build -DCMAKE_BUILD_TYPE=Release
        cd build
        cmake --build . --target seer --parallel
}

package() {
	cd "$srcdir/build"
        cmake --install . --strip --prefix "$pkgdir/usr/"

        cd "$srcdir/${pkgname}/src/resources"
        install -Dm644 'seer_32x32.png' "$pkgdir/usr/share/icons/hicolor/32x32/apps/seer.png"
        install -Dm644 'seer_64x64.png' "$pkgdir/usr/share/icons/hicolor/64x64/apps/seer.png"
        install -Dm644 'seer_128x128.png' "$pkgdir/usr/share/icons/hicolor/128x128/apps/seer.png"
        install -Dm644 'seer_256x256.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/seer.png"
        install -Dm644 'seer_512x512.png' "$pkgdir/usr/share/icons/hicolor/512x512/apps/seer.png"

        install -Dm644 'seer.desktop' -t "$pkgdir/usr/share/applications"
}


