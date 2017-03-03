# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=argdata
pkgver=0.2
pkgrel=1
pkgdesc="binary serialisation format inspired by YAML, MessagePack and nvlists"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('BSD')
depends=()
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/argdata/archive/v$pkgver.tar.gz")
sha512sums=('fc233953a7012b8e2c7eebe7ec3f8262e66bd603719cf3a701dfe5558859e4a08266a768544a729fa3e4e8ea76b2f9e62a47e7b12d9e1427becd06e3ae0cbfcd')

prepare() {
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
}
