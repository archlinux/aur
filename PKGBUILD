# Maintainer: Dale Whinham <daleyo at gmail dot com>
pkgname=mt32-pi-control
pkgver=1.0.0a
pkgrel=1
pkgdesc="A control program for the mt32-pi MIDI synthesizer"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/gmcn42/mt32-pi-control"
license=("BSD")
depends=("alsa-lib")
source=("https://github.com/gmcn42/mt32-pi-control/archive/v$pkgver.tar.gz")
sha256sums=("ff86af3b29d814452831b066cde2e47271d658a447e213e56bb4e992f0434a1e")

build() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	mkdir -p linux_bin
	make -C linux_src -j dist
}

package() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	install -Dm755 linux_bin/mt32-pi-ctl "$pkgdir"/usr/bin/mt32-pi-ctl
	install -Dm644 linux_bin/mt32pi.bmp "$pkgdir"/usr/share/"$pkgname"/mt32pi.bmp
	install -m644 README.md "$pkgdir"/usr/share/"$pkgname"/README.md

	# License is BSD 2-clause and needs to be installed
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
