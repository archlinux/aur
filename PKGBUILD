# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=1.4.8.823
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
_chromever=$(curl -s https://omahaproxy.appspot.com/linux)
source=('chrome-eula_text.html::https://www.google.com/chrome/intl/en/eula_text.html')
source_i686=("google-chrome-stable_${_chromever}_i386.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb")
source_x86_64=("google-chrome-stable_${_chromever}_amd64.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
sha256sums=('b35811bb330576631e64f7885c66720e0be4ca81afb04328b3a0f288a708e37f')
sha256sums_i686=('1d89c5657577187db071cd791f43105a8f749b344b2638d9f07ae1fe6fe7fe7d')
sha256sums_x86_64=('15dcab923da9694c0f12ef47942af65a769a478f22c1e39e69b28e29e41f686d')

pkgver() {
  bsdtar -xf data.tar.xz opt/google/chrome/{chrome,libwidevine*.so}
  strings opt/google/chrome/chrome | sed -n '/ (version:/{n;p}'
}

package() {
  install -d "$pkgdir/usr/lib/chromium/"
  install -m644 opt/google/chrome/*.so "$pkgdir/usr/lib/chromium/"
  install -Dm644 chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
