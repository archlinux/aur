# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor Oliver Rümpelein <arch@pheerai.de>
# Contributor/Base PKGBUILD: Doug Newgard <scimmia at archlinux dot info>

pkgname=vivaldi-widevine
pkgdesc="A browser plugin designed for the viewing of premium video content, standalone for vivaldi"
pkgver=4.10.1582.1
_chrome_ver=78.0.3904.87
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
source=("chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb"
        get_cdm_version.c)
options=("!strip")
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')
conflicts=('google-chrome')
sha256sums=('SKIP'
            'b8f00eee94d07b1665b85006fc3e06b5390c2a8970187dfd009a66c00f32e5f8'
            '3fda44a5b8b222434530f27923568de1fda1eb0caa8621b56a8b2a6a2a2e3d5d')

prepare() {
  bsdtar -x --strip-components 4 -f data.tar.xz opt/google/chrome/WidevineCdm
}

pkgver() {
  awk 'match($0,/"version": "([0-9.]*)"/,a) {print a[1];}' WidevineCdm/manifest.json
}

package() {
  install -dm755 "$pkgdir/opt/google/chrome/"
  cp -a WidevineCdm "$pkgdir/opt/google/chrome/"
  install -Dm644 chrome-eula_text.html -t "$pkgdir/usr/share/licenses/$pkgname/"
}
