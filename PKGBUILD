# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.dokobit.com/downloads/test-system
pkgname=dokobit-plugin
pkgver=1.3.22.0
pkgrel=2
pkgdesc="Google Chrome & Mozilla native smartcard plugin for Dokobit"
url="https://www.dokobit.com/downloads"
depends=(gcc-libs openssl-1.0 qt5-base)
arch=(x86_64)
source_x86_64=("https://github.com/dokobit/browser-plugin/raw/master/Linux/64Bit/dokobit-plugin-en_${pkgver}.deb")
sha256sums_x86_64=('816dfd3f7f80f5da6141a98c378e9797ec869eb3d63397cd3bd5831ec9138df7')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
	# for binary Google Chrome
	mkdir "$pkgdir"/etc/opt
	cp -av "$pkgdir"/etc/chromium "$pkgdir"/etc/opt/chrome
	# bundled openssl 1.0.1d (we have 1.0.2u)
	rm "$pkgdir"/usr/lib/dokobit-plugin/libcrypto.so
}
