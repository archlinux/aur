# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qt5-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content (E.g. Spotify)'
pkgver=93.0.4577.63
pkgrel=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
depends=('qt5-webengine')
options=('!strip')
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb")
sha256sums=('0c0fdebe4f4403885c2c2d9f19803cef7ac75b2a5bd4a96005e16c9b952067cf')

prepare() {
  bsdtar -x --strip-components 7 -f data.tar.xz opt/google/chrome/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so
  bsdtar -x --strip-components 5 -f data.tar.xz opt/google/chrome/WidevineCdm/LICENSE
}

package() {
  install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
