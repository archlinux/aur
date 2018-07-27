# Maintainer: Jesse McClure aka "Trilby" <jmcclure at broadinstitute dog org>

pkgname=qt5-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=66.0.3359.181
pkgrel=1
epoch=1
arch=('x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
depends=('qt5-webengine')
source=('chrome-eula_text.html::https://www.google.com/intl/en/chrome/browser/privacy/eula_text.html'
        "https://www.slimjet.com/chrome/download-chrome.php?file=lnx%2Fchrome64_${pkgver}.deb")
sha256sums=('fdabe95fea54cac48582fe8872cd7c1a5b3fbb38d0c0a9acc90ab91f8fbceeaf'
            '229b35f0d41bbb6edd98ce4ab8305994a0f5cd1ac4d9817571f07365b2d1ad80')

prepare() {
	bsdtar -x --strip-components 4 -f data.tar.xz opt/google/chrome/libwidevinecdm.so
}

package() {
	install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
	install -Dm644 chrome-eula_text.html -t "$pkgdir/usr/share/licenses/$pkgname/"
}
