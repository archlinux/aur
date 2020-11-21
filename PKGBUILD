# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=firefox-clearurls
pkgver=1.20.0
pkgrel=1
pkgdesc='Firefox addon that removes tracking elements from URLs'
arch=('any')
url='https://clearurls.xyz/'
license=('LGPL3')
source=("https://github.com/ClearURLs/Addon/releases/download/$pkgver/clearurls-$pkgver-firefox.xpi")
noextract=("${source##*/}")
sha256sums=('d6b4bdb79197e3a0edb8e96d9e8f49147e12b8b6f48021a8613d7f08eec6bda4')

prepare() {
  mkdir tmp && cd tmp
  bsdtar -xf "../${source##*/}"
  sed -i 's/"default_locale": "en",/"default_locale": "en",    \
    "browser_specific_settings": {                             \
      "gecko": {                                               \
        "id": "{74145f27-f039-47ce-a470-a662b129930a}"         \
      }                                                        \
    },/' manifest.json
  bsdtar -caf clearurls.zip *
}

package() {
  install -Dm644 tmp/clearurls.zip "$pkgdir/usr/lib/firefox/browser/extensions/{74145f27-f039-47ce-a470-a662b129930a}.xpi"
}
