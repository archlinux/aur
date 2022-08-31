# Maintainer: jabra11 <jabra11.gpg@gmail.com>
pkgname=seer-gdb-git
pkgver=1.9.r0.ge9a916b
pkgrel=1
pkgdesc="Seer - a gui frontend to gdb"
arch=('x86_64')
url="https://github.com/epasveer/seer.git"
license=('GPL3')
depends=('qt5-base' 'gdb' 'qt5-charts')
conflicts=("${pkgname%-git}")
makedepends=('git' 'gcc' 'cmake' 'qt5-base' 'qt5-charts')
provides=("${pkgname%-git}")
source=("${pkgname%-gdb-git}::git+https://github.com/epasveer/${pkgname%-gdb-git}.git")
md5sums=('SKIP')

pkgver() {
        cd "${pkgname%-gdb-git}"
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        [ ! -d "build" ] && mkdir build
        cmake -S ${pkgname%-gdb-git}/src -B build -DCMAKE_BUILD_TYPE=Release
        cd build
        cmake --build . --target seergdb
}

package() {
	cd "$srcdir/build"
        cmake --install . --prefix "$pkgdir/usr/"
}
