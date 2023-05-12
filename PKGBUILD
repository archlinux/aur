# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor Oliver Rümpelein <arch@pheerai.de>
# Contributor/Base PKGBUILD: Doug Newgard <scimmia at archlinux dot info>

pkgname=vivaldi-widevine
pkgdesc="A browser plugin designed for the viewing of premium video content, standalone for vivaldi"
pkgver=4.10.2652.0
_chrome_ver=113.0.5672.92
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
options=("!strip")
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')
conflicts=('google-chrome')
sha256sums=('bbedbeb0b32afbe2eb07b3dfd659d7dec128eb73eb4f4a9bd5a25fe03961a177')

prepare() {
  bsdtar -x --strip-components 4 -f data.tar.xz opt/google/chrome/WidevineCdm
}

pkgver() {
  awk 'match($0,/"version": "([0-9.]*)"/,a) {print a[1];}' WidevineCdm/manifest.json
}

package() {
  install -dm755 "$pkgdir/opt/google/chrome/"
  cp -a WidevineCdm "$pkgdir/opt/google/chrome/"
  install -Dm644 WidevineCdm/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
