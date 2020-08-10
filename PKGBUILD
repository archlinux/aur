# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qt5-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content (E.g. Spotify)'
pkgver=84.0.4147.105
pkgrel=2
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
depends=('qt5-webengine')
options=('!strip')
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb"
        "https://www.google.com/intl/en/chrome/privacy/eula_text.html")
sha256sums=('dc7fa2ca2dccf482524dc2a343662859a22ad1fb33767447d7de6fcf6cc1dd7e'
            'f68e9de22adbf8fb0725e27f3a9d94a44bb816ef5751296fedb8cfb448db566c')

prepare() {
  bsdtar -x --strip-components 7 -f data.tar.xz opt/google/chrome/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so
}

package() {
	install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
	install -Dm644 eula_text.html -t "$pkgdir/usr/share/licenses/$pkgname/"
}
