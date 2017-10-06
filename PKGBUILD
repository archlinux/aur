# Maintainer: Jesse McClure aka "Trilby" <jesse dot mcclure at umassmed dot edu>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=qt5-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=61.0.3163.100
pkgrel=2
epoch=1
arch=('x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
depends=('qt5-webengine')
source=("http://ftp.us.debian.org/debian/pool/contrib/c/chromium-browser/chromium-widevine_${pkgver}-${pkgrel}_amd64.deb"
'https://dl.google.com/widevine-cdm/1.4.8.1008-linux-x64.zip'
'chrome-eula_text.html::https://www.google.com/intl/en/chrome/browser/privacy/eula_text.html')
sha256sums=('c27c44a89895840addb191f9fdf87430b3895d7b33015048a7fb82148f3003e8'
'fe04a5b56eac6674f1eda2c8eb28a0183ec1a66d80f72db618291e33078eb17d'
'e93c01576427cad9099f2cf0df0be70d0a2cc0a3a66c743318b2138aa7c4ed93')

prepare() {
bsdtar -xf data.tar.xz usr/lib/chromium/libwidevinecdmadapter.so
}

package() {
install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
install -Dm644 usr/lib/chromium/libwidevinecdmadapter.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
install -Dm644 chrome-eula_text.html -t "$pkgdir/usr/share/licenses/$pkgname/"
}

