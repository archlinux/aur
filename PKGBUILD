# Maintainer: Rohan Rao	<rao.rohan.a@gmail.com>
pkgname=rust-nightly-src
pkgver=1.16.0_2017.01.21
pkgrel=1
pkgdesc="Rust source files"
arch=('any')
url="http://rust-lang.org"
license=('MIT' 'Apache')
options=(!strip)
conflicts=('rust-src')
source=("https://static.rust-lang.org/dist/rustc-nightly-src.tar.gz")
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/rustc-nightly-src
	ver="$(grep -m 1 'CFG_RELEASE_NUM' mk/main.mk | sed 's|CFG_RELEASE_NUM=\(.*\)|\1|')"
	date="$(date +%Y.%m.%d)"
	echo "${ver}_${date}"
}

prepare() {
	cd "rustc-nightly-src"
	find . -type d -exec chmod 755 {} \;
	find . -type f -exec chmod 644 {} \;
}

package() {
	cd "rustc-nightly-src"
	mkdir -p "$pkgdir/usr/src/rust/"
	cp -r * "$pkgdir/usr/src/rust/"
}
