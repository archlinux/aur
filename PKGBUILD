# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor Oliver Rümpelein <arch@pheerai.de>
# Contributor/Base PKGBUILD: Doug Newgard <scimmia at archlinux dot info>

pkgname=vivaldi-widevine
pkgdesc="A browser plugin designed for the viewing of premium video content, standalone for vivaldi"
pkgver=1.4.9.1076
_chrome_ver=66.0.3359.139
pkgrel=2
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
source=('chrome-eula_text.html::https://www.google.com/intl/en/chrome/browser/privacy/eula_text.html'
        "https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
options=("!strip")
license=('custom')
depends=('vivaldi-ffmpeg-codecs' 'glib2')
conflicts=('chromium-widevine' 'google-chrome')
sha256sums=('cbfb7bc8d48ffc2dc6a86721c00b1662337bf72e7e63bffde783497cf36a43fa'
            'e04b7bbea56ee1d6731113928c4876ff99b02eb8826293e40e260138bc7af9ed')

prepare() {
  bsdtar -xf data.tar.xz opt/google/chrome/libwidevinecdm.so
}

pkgver() {
  strings opt/google/chrome/libwidevinecdm.so | grep -P "1\.\d+\.\d+\.\d+"
}

package() {
  install -Dm644 opt/google/chrome/libwidevinecdm.so -t "$pkgdir/opt/google/chrome/"
  install -Dm644 chrome-eula_text.html -t "$pkgdir/usr/share/licenses/$pkgname/"
}

