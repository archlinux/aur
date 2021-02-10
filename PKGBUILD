# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.isign.io/chrome-extension-verify
pkgname=dokobit-plugin
pkgver=1.3.14.0
pkgrel=1
pkgdesc="Google Chrome & Mozilla native smartcard plugin for Dokobit (previously called isign-chrome-signing)"
url="https://www.dokobit.com/downloads"
depends=(openssl-1.0 qt5-base)
provides=(isign-chrome-signing=$pkgver)
replaces=(isign-chrome-signing)
conflicts=(isign-chrome-signing)
arch=(i686 x86_64)
source_i686=("https://github.com/dokobit/browser-plugin/raw/master/Linux/32Bit/dokobit-plugin-en_${pkgver}.deb")
source_x86_64=("https://github.com/dokobit/browser-plugin/raw/master/Linux/64Bit/dokobit-plugin-en_${pkgver}.deb")
sha256sums_i686=('f38b9b4105ee48ab593c7f59079f6ebe3be7764db3864782ba62a47352c04cbe')
sha256sums_x86_64=('4bf3a22d83bea107b3c7672d7095e1fe0b8ffb87c52d3859504e44974300f020')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
	# bundled openssl 1.0.1d
	rm "$pkgdir"/usr/lib/dokobit-plugin/libcrypto.so
}
