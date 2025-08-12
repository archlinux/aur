# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Jonathan Hudson <jh+mwptools@daria.co.uk>

pkgname=blackbox-tools-inav
pkgver=8.0.2
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
sha512sums=('833ef082b71f800dfefd29ba506c26657fefd671fa358307488157a745bed0a8bf3035c627de47f75a9d811407bded21b03e2a171b7d3807bf2bb443699de536')

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
