# Maintainer: Max Bruckner
pkgname=qmake2cmake
pkgver=2
pkgrel=1
pkgdesc="Tool to convert qmake build scripts to cmake."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/qmake2cmake/"
license=('GPL3')
depends=('qt4')
makedepends=('cmake')
source=(
"$pkgname::svn+svn://svn.code.sf.net/p/qmake2cmake/code/"
'qmake2cmake.desktop'
)
sha512sums=('SKIP'
            'a14b722ef37997aabdcb0c8477fbed99aba175feee3745bfc38a0d6e9989b8c558288148ae02be32dc998a4ae48fc1d4a19c0ed93880727b4b7c031e0e564437')

prepare() {
	cd "$srcdir/$pkgname"
	[[ ! -d build ]] && mkdir build
	cd build
	cmake ..
}

build() {
	cd "$srcdir/$pkgname/build"
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	install -m 755 qm2cm "$pkgdir/usr/bin"
	install -m 644 "$srcdir/qmake2cmake.desktop" "$pkgdir/usr/share/applications/"
	ln -s qm2cm "$pkgdir/usr/bin/$pkgname"
}
