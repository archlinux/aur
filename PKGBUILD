# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=argdata
pkgver=0.7
pkgrel=1
pkgdesc="binary serialisation format inspired by YAML, MessagePack and nvlists"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('BSD')
depends=()
makedepends=('cmake')

source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/argdata/archive/v$pkgver.tar.gz")
sha512sums=('cae775ee3634cfd93c6f19cec1ae85bd9a1977a2a916a23c48b77207001d3311cbdefdf39e2146ba2f61478ab6480348213683f860696032c313a9728df2b64f')

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	cmake "$srcdir/$pkgname-$pkgver" \
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
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/CONTRIBUTORS"
}
