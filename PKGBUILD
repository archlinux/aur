# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=qt6-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content (E.g. Spotify)'
pkgver=135.0.7049.52
pkgrel=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
depends=('qt6-webengine')
options=('!strip')
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb")
sha256sums=('48b4709ba5ca827335c5486cf2757250248586adf21f77c7a0dda1f1dda0a6da')

prepare() {
  bsdtar -x --strip-components 7 -f data.tar.xz opt/google/chrome/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so
  bsdtar -x --strip-components 5 -f data.tar.xz opt/google/chrome/WidevineCdm/LICENSE
}

package() {
  install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt6/plugins/ppapi/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
