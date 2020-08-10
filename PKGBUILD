# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qt5-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content (E.g. Spotify)'
pkgver=84.0.4147.105
pkgrel=3
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
depends=('qt5-webengine')
options=('!strip')
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb")
sha256sums=('dc7fa2ca2dccf482524dc2a343662859a22ad1fb33767447d7de6fcf6cc1dd7e')

prepare() {
  bsdtar -x --strip-components 7 -f data.tar.xz opt/google/chrome/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so
  bsdtar -x --strip-components 5 -f data.tar.xz opt/google/chrome/WidevineCdm/LICENSE
}

package() {
	install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
