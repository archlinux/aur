# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=seer-gdb
pkgver=1.7
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
}


