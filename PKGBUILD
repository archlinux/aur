# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=firefox-h264ify
pkgver=1.1.0
pkgrel=2
pkgdesc='Makes YouTube stream H.264 videos instead of VP8/VP9 videos'
arch=('any')
url=https://github.com/erkserkserks/h264ify
license=('MIT')
source=("https://addons.mozilla.org/firefox/downloads/file/3398929/h264ify-${pkgver}.xpi")
noextract=("${source##*/}")
sha256sums=('87bd3c4ab1a2359c01a1d854d7db8428b44316fef5b2ac09e228c5318c57a515')

prepare() {
  mkdir tmp && cd tmp
  bsdtar -xf "../${source##*/}"
  sed -i 's/\[ "storage" \]/\[ "storage" \],     \
    "browser_specific_settings": {               \
      "gecko": {                                 \
        "id": "jid1-TSgSxBhncsPBWQ@jetpack"      \
      }                                          \
    }/' manifest.json
  bsdtar -caf h264ify.zip *
}

package() {
  install -Dm644 tmp/h264ify.zip "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-TSgSxBhncsPBWQ@jetpack.xpi
}
