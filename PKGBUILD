# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Jonathan Hudson <jh+mwptools@daria.co.uk>

pkgname=blackbox-tools-inav
pkgver=8.0.0
pkgrel=1
pkgdesc='tools for examining INAV blackbox logs'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/iNavFlight/blackbox-tools"
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('cairo' 'freetype2')
provides=('blackbox-tools')
conflicts=('blackbox-tools' 'blackbox-tools-git')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('8a5bdcc962f986c0d3205b23d172eb2bb70d986532e96ae1f13ab026105405304b1826f0cf8460bc3c3eedb5cd81628835ead11afc2bfcb8ed716afe6726f89b')

build() {
	cd $pkgname
	make
}

package() {
	cd $pkgname
	install -Dm755 obj/blackbox_decode -t "$pkgdir/usr/bin/"
	install -Dm755 obj/blackbox_render -t "$pkgdir/usr/bin/"
	install -Dm755 obj/encoder_testbed -t "$pkgdir/usr/bin/"
	install -Dm644 tools/blackbox_decode_complete.sh \
		"$pkgdir/usr/share/bash-completion/completions/blackbox_decode"
}
