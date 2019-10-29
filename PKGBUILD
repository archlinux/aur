# Maintainer: Mirko Scholz <srtlg>
pkgname=tk-togl
pkgver=2.0
pkgrel=1
pkgdesc="A Tcl/Tk widget for OpenGL rendering."
arch=('x86_64')
url="https://sourceforge.net/projects/togl/"
license=('BSD')
depends=(tk tcl libglvnd libxmu)
_name=Togl2.0
source=("${_name}.tar.gz::https://sourceforge.net/projects/togl/files/Togl/2.0/${_name}-src.tar.gz/download"
        "fix-configure.patch")
sha256sums=('b7d4a90bbad3aca618d505ee99e7fd8fb04c829f63231dda2360f557ba3f7610'
            '79d1519517787c1a36d3493dde915a06005633fff6fba60d88b4516fce3d0268')

prepare() {
	cd $_name
	patch -p1 -i "$srcdir/fix-configure.patch"
}

build() {
	cd $_name
	./configure
	make
}

package() {
	cd $_name
	make install "DESTDIR=$pkgdir"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	ln -s /usr/lib/Togl2.0/LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	rm -rf "$pkgdir/usr/bin"
	chmod 444 "$pkgdir/usr/lib/libToglstub2.0.a"
}

