# Maintainer: Bernardo Ferrari Mendonca <bernardo.mferrari@gmail.com>
pkgname=ophidian-verilog-parser-git
pkgver=0.2
pkgrel=2
groups=('ophidian')
pkgdesc="A Flex/Bison parser for the IEEE 1364-2001 Verilog Standard."
arch=('x86_64')
url="https://gitlab.com/eclufsc/verilog-parser"
license=('MIT')
options=(staticlibs)
makedepends=('cmake' 'make' 'bison' 'flex')
source=('git+https://gitlab.com/eclufsc/verilog-parser.git#branch=master')
md5sums=('SKIP')

build() {
	cd $srcdir/verilog-parser
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    install -d $pkgdir/usr/share/verilog-parser
    install -D -m 644 $srcdir/verilog-parser/LICENSE.txt $pkgdir/usr/share/verilog-parser/copyright

	cd $srcdir/verilog-parser/build
	make DESTDIR="$pkgdir/" install
}
