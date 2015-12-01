# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=1.4.8.865
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
_packaged_chrome_ver=47.0.2526.73
_current_chrome_ver=$(curl -s https://omahaproxy.appspot.com/linux)
depends=("chromium>=${_current_chrome_ver%%.*}")
source=('chrome-eula_text.html::https://www.google.com/chrome/intl/en/eula_text.html')
source_i686=("google-chrome-stable_${_current_chrome_ver}_i386.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb")
source_x86_64=("google-chrome-stable_${_current_chrome_ver}_amd64.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
sha256sums=('b35811bb330576631e64f7885c66720e0be4ca81afb04328b3a0f288a708e37f')
sha256sums_i686=('fe29be58d067b817678986d49789650a6062bfcecf6840c1b956f58034092ff9')
sha256sums_x86_64=('ea9f04f0cd586e48c5fb28a8226222080d8c2a5822f546e0b6a13956a6fd00f8')

pkgver() {
  bsdtar -xf data.tar.xz opt/google/chrome/{chrome,libwidevine*.so}
  strings opt/google/chrome/chrome | sed -n '/ (version:/{n;p}'
}

package() {
  install -Dm644 -t "$pkgdir/usr/lib/chromium/" opt/google/chrome/*.so
  install -Dm644 chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
