# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=arpc
pkgver=0.6.p1
pkgrel=1
pkgdesc="binary serialisation format inspired by YAML, MessagePack and nvlists"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('BSD')
depends=()
makedepends=('cmake' 'python-pypeg2' 'python-toposort')

_commit="49c6d4aa50dd325f9ce56ff9ebe1de210caac593"
source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/$pkgname/archive/$_commit.tar.gz")
sha512sums=('d8d724e49c43d99d5c494404b3458debc82a7fe1c78aa66ef47d217ab05b7c91abc746a730fb91e78d5cc089bc528875b612094ac74898eb149f8f363fbff66b')

_dir="$pkgname-$_commit"
prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	cmake "$srcdir/$_dir" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_dir/LICENSE"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_dir/CONTRIBUTORS"
}
