# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=1.4.8.824
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
_chrome_ver=47.0.2526.106
depends=("chromium>=${_chrome_ver%%.*}")
source=('chrome-eula_text.html::https://www.google.com/chrome/intl/en/eula_text.html')
source_i686=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_i386.deb")
source_x86_64=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
sha256sums=('b35811bb330576631e64f7885c66720e0be4ca81afb04328b3a0f288a708e37f')
sha256sums_i686=('168de6fe1f98ab00f73e8a370796b57a8977130ebde7e85ef4de7d8a7a695b93')
sha256sums_x86_64=('a9d9307f90a0d5a1129df8b6478837876275298c545c28c60a697cc577422288')

pkgver() {
  bsdtar -xf data.tar.xz opt/google/chrome/{chrome,libwidevine*.so}
  strings opt/google/chrome/chrome | sed -n '/ (version:/{n;p}'
}

package() {
  install -Dm644 -t "$pkgdir/usr/lib/chromium/" opt/google/chrome/*.so
  install -Dm644 chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
