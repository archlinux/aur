# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
pkgname=dybuk-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Prettify the ugly Rustc messages"
arch=(i686 x86_64)
url="https://github.com/Ticki/dybuk"
license=('MIT')
depends=(gcc-libs)
makedepends=('git' 'rust' 'cargo')
provides=(dybuk)
conflicts=(dybuk)
source=('git://github.com/Ticki/dybuk.git')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/dybuk"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/dybuk"
	cargo build --release
}

package() {
	cd "$srcdir/dybuk"
	install -m755 -D target/release/dybuk "$pkgdir/usr/bin/dybuk"
	install -D -m644 "LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

