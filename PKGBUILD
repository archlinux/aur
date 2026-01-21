# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Jonathan Hudson <jh+mwptools@daria.co.uk>

pkgname=blackbox-tools-inav
pkgver=9.0.0
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
sha512sums=('c06fc3598a1c630fbb699e3f68b8325237bd7ff09eae8ee5cb4803fb6ff73dad89ca2808e6411b7e08e4203b00947ea9e704364706b42b1c987f21bbf6059574')

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
