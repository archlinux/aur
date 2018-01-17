# Maintainer: Bernardo Ferrari Mendonca <bernardo.mferrari@gmail.com>
pkgname=ophidian-flute-git
pkgver=1.0
pkgrel=2
groups=('ophidian')
pkgdesc="A rectilinear Steiner minimal tree and wirelength algorithm described in the ICCAD 04 and ISPD 05 papers."
arch=('x86_64')
url="https://gitlab.com/eclufsc/Flute"
license=('custom')
options=(staticlibs)
makedepends=('make' 'bison' 'flex')
source=('git+https://gitlab.com/eclufsc/Flute.git#branch=master')
md5sums=('SKIP')


build() {
	cd $srcdir/Flute
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    install -d $pkgdir/usr/share/Flute
    install -D -m 644 $srcdir/Flute/license.txt $pkgdir/usr/share/Flute/copyright

	cd $srcdir/Flute/build
	make DESTDIR="$pkgdir/" install
}
