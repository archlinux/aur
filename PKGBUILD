# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=1.4.8.824
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
_packaged_chrome_ver=47.0.2526.80
_current_chrome_ver=$(curl -s https://omahaproxy.appspot.com/linux)
depends=("chromium>=${_current_chrome_ver%%.*}")
source=('chrome-eula_text.html::https://www.google.com/chrome/intl/en/eula_text.html')
source_i686=("google-chrome-stable_${_current_chrome_ver}_i386.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb")
source_x86_64=("google-chrome-stable_${_current_chrome_ver}_amd64.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
sha256sums=('b35811bb330576631e64f7885c66720e0be4ca81afb04328b3a0f288a708e37f')
sha256sums_i686=('6619ea29836214ab27dd838f8924901bf15a497dc97d57a0c58371abcbf8e91c')
sha256sums_x86_64=('bb39a1827b1aab49b2b88263a7a4c511c41ce450d97027037559e9d60d884976')

pkgver() {
  bsdtar -xf data.tar.xz opt/google/chrome/{chrome,libwidevine*.so}
  strings opt/google/chrome/chrome | sed -n '/ (version:/{n;p}'
}

package() {
  install -Dm644 -t "$pkgdir/usr/lib/chromium/" opt/google/chrome/*.so
  install -Dm644 chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
