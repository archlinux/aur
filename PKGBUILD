# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=argdata
pkgver=0.3pre
pkgrel=1
pkgdesc="binary serialisation format inspired by YAML, MessagePack and nvlists"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/cloudabi-utils'
license=('BSD')
depends=()
makedepends=('cmake')

_commit="8ad3e676a74dc54467f13bbaba6a8b00bb47bfe2"
source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/argdata/archive/$_commit.tar.gz")
sha512sums=('355ba5b08b3ac2e3ad4ecfab6c6114173cea95c2d9596d36eededc637fd26df0993046884af56771e44076e34327bb645347191554a44f9dd87743af827f12e7')

prepare() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$pkgname-$_commit" \
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
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$_commit/LICENSE"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$_commit/CONTRIBUTORS"
}
