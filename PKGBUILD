# Maintainer: Cimu Wang <cimu58@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Robert Cegliński <rob.ceglinski@gmail.com>

_name=ClearUrls
pkgname=firefox-clearurls
pkgver=1.26.0
pkgrel=1
pkgdesc='Removes tracking elements from URLs'
arch=('any')
url=https://clearurls.xyz
license=('LGPL3')
groups=('firefox-addons')
makedepends=('strip-nondeterminism' 'zip')
#source=("https://gitlab.com/KevinRoebert/$_name/-/archive/$pkgver/$_name-$pkgver.tar.gz")
source=("https://github.com/$_name/Addon/archive/refs/tags/$pkgver.tar.gz")
md5sums=('ae8af03e72047c93be2503153bd901d9')

prepare() {
  cd Addon-$pkgver
  sed -i 's/"default_locale": "en",/"default_locale": "en",\
    "browser_specific_settings": {\
      "gecko": {\
        "id": "{74145f27-f039-47ce-a470-a662b129930a}"\
      }\
    },/' manifest.json
}

package() {
  cd Addon-$pkgver
  install -d "$pkgdir"/usr/lib/firefox/browser/extensions
  zip -r \
    "$pkgdir"/usr/lib/firefox/browser/extensions/{74145f27-f039-47ce-a470-a662b129930a}.xpi \
    clearurls.js browser-polyfill.js manifest.json img/* external_js/* html/* \
    core_js/* css/* fonts/* _locales/*
  strip-nondeterminism -t zip "$pkgdir"/usr/lib/firefox/browser/extensions/*
}

# vim:set ts=2 sw=2 et:
