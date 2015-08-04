# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=1.4.8.823
pkgrel=2
arch=('i686' 'x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
_packaged_chrome_ver=44.0.2403.130
_current_chrome_ver=$(curl -s https://omahaproxy.appspot.com/linux)
depends=("chromium>=${_current_chrome_ver%%.*}")
source=('chrome-eula_text.html::https://www.google.com/chrome/intl/en/eula_text.html')
source_i686=("google-chrome-stable_${_current_chrome_ver}_i386.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb")
source_x86_64=("google-chrome-stable_${_current_chrome_ver}_amd64.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
sha256sums=('b35811bb330576631e64f7885c66720e0be4ca81afb04328b3a0f288a708e37f')
sha256sums_i686=('bb041e86d8ccc571c5c4f327bb8643e2b11fb72a879534b6e35129c13d86f27b')
sha256sums_x86_64=('0b29ab582fd82a1587626f33025a50d4748df7ddea0eca6e36df63bb5ba6fcb7')

pkgver() {
  bsdtar -xf data.tar.xz opt/google/chrome/{chrome,libwidevine*.so}
  strings opt/google/chrome/chrome | sed -n '/ (version:/{n;p}'
}

package() {
  install -d "$pkgdir/usr/lib/chromium/"
  install -m644 opt/google/chrome/*.so "$pkgdir/usr/lib/chromium/"
  install -Dm644 chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
