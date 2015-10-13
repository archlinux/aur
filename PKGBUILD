# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=1.4.8.824
pkgrel=2
arch=('i686' 'x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
_packaged_chrome_ver=46.0.2490.71
_current_chrome_ver=$(curl -s https://omahaproxy.appspot.com/linux)
depends=("chromium>=${_current_chrome_ver%%.*}")
source=('chrome-eula_text.html::https://www.google.com/chrome/intl/en/eula_text.html')
source_i686=("google-chrome-stable_${_current_chrome_ver}_i386.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb")
source_x86_64=("google-chrome-stable_${_current_chrome_ver}_amd64.deb::https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
sha256sums=('b35811bb330576631e64f7885c66720e0be4ca81afb04328b3a0f288a708e37f')
sha256sums_i686=('4e931cedefb37ce905c51075c4a328202bfc97ec06eae37ff3b3fe26c6632aec')
sha256sums_x86_64=('d70e55812164bf4f35f629af302ee53fc771ee4e00ffd26205e6541f3b6c8a96')

pkgver() {
  bsdtar -xf data.tar.xz opt/google/chrome/{chrome,libwidevine*.so}
  strings opt/google/chrome/chrome | sed -n '/ (version:/{n;p}'
}

package() {
  install -Dm644 -t "$pkgdir/usr/lib/chromium/" opt/google/chrome/*.so
  install -Dm644 chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
