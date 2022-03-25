# Maintainer: jabra98 <jabra98.gpg@gmail.com>
pkgname=seer-gdb-git
pkgver=r184.9d3984c761
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
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

build() {
        [ ! -d "build" ] && mkdir build
        cmake -S ${pkgname%-gdb-git}/src -B build -DCMAKE_BUILD_TYPE=Release
        cd build
        cmake --build . --target seer --parallel
}

package() {
	cd "$srcdir/build"
        cmake --install . --strip --prefix "$pkgdir/usr/"
}
