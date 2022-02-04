# Maintainer: jabra98 <jabra98.gpg@gmail.com>
pkgname=seer-gdb-git
pkgver=r108.f0d9245ee3
pkgrel=1
pkgdesc="Seer - a gui frontend to gdb"
arch=('x86_64')
url="https://github.com/epasveer/seer.git"
license=('GPL3')
depends=('qt5-base' 'gdb')
conflicts=("${pkgname%-git}")
makedepends=('git' 'gcc' 'cmake' 'qt5-base')
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
