# Maintainer: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=yosys-git
pkgrel=2
pkgver=r2435.e51dcc8
pkgdesc='A framework for RTL synthesis'
arch=('x86_64' 'i686')
url='http://www.clifford.at/yosys/'
license=('ISC')
provides=("yosys")
conflicts=("yosys")
depends=('tcl' 'libffi' 'clang' 'python')
optdepends=('graphviz: Schematics display support')
makedepends=('git' 'mercurial')
source=('git+https://github.com/cliffordwolf/yosys.git')
sha512sums=('SKIP')

build(){
    cd ${srcdir}/yosys
    make
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/yosys
    make DESTDIR="$pkgdir/usr/" install
}
