# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=1.4.8.1029
_chrome_ver=63.0.3239.108
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
options=('!strip')
source=('chrome-eula_text.html::https://www.google.com/intl/en/chrome/browser/privacy/eula_text.html'
        "https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
sha256sums=('e93c01576427cad9099f2cf0df0be70d0a2cc0a3a66c743318b2138aa7c4ed93'
            'c9e71c9fa76878d25c86538f732d50a7af3544c2b1cd19953a07c3f8d4ec1ca1')

prepare() {
  bsdtar -xf data.tar.xz opt/google/chrome/{chrome,libwidevinecdm.so}
}

pkgver() {
  awk 'match($0,/\(version: \0?([0-9.]+)/,a) {print a[1];}' opt/google/chrome/chrome
}

package() {
  depends=('chromium' 'gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')

  install -Dm644 opt/google/chrome/libwidevinecdm.so -t "$pkgdir/usr/lib/chromium/"
  install -Dm644 chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
