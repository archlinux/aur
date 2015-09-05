# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
pkgname=xsv-git
pkgver=0.9.8.r1.411a3bb
pkgrel=1
pkgdesc=""
arch=(i686 x86_64)
url="https://github.com/BurntSushi/xsv"
license=('CUSTOM')
depends=(gcc-libs)
makedepends=('git' 'rust' 'cargo')
provides=(xsv)
conflicts=(xsv)
source=('git://github.com/BurntSushi/xsv.git')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/xsv"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/xsv"
	cargo build --release
}

package() {
	cd "$srcdir/xsv"
	install -m755 -D target/release/xsv "$pkgdir/usr/bin/xsv"
	install -D -m644 "UNLICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}

