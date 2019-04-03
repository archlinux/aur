# Maintainer: Jesse McClure aka "Trilby" <code at jessemcclure dot org>

pkgname=qt5-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=73.0.3683.86
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
depends=('qt5-webengine')
options=('!strip')
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb"
        "https://www.google.com/intl/en/chrome/privacy/eula_text.html")
sha256sums=('6bca2828da09563634bce48cfb899f3fb1d069285a297ca5916d3bb63b25b5d6'
            'SKIP')

prepare() {
  bsdtar -x --strip-components 4 -f data.tar.xz opt/google/chrome/libwidevinecdm.so
}

package() {
	install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
	install -Dm644 eula_text.html -t "$pkgdir/usr/share/licenses/$pkgname/"
}
