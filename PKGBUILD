# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=firefox-esr-extension-download-with-aria2
pkgver=4.10.0.2690
pkgrel=1
pkgdesc='The Aria2 Download Manager for Firefox ESR'
arch=('any')
url='https://github.com/jc3213/download_with_aria2'
license=('LGPL-2.1-or-later')
depends=('firefox-esr')
makedepends=('jq')
groups=('firefox-esr-addons')
source=("$pkgname::git+https://github.com/jc3213/download_with_aria2#tag=$pkgver")
sha1sums=('9d7fd622696cf39f923e9e51898802edcdf438f4')

build() {
  cd "$pkgname"
  sh linux_build.sh firefox
}

package() {
  cd "$pkgname"
  local id && id=$(jq -j '..|.gecko?.id//empty' firefox/manifest.json)
  msg2 "Firefox extension id is $id"
  install -Dm644 build/firefox/${pkgver}.xpi \
    "${pkgdir}/usr/lib/firefox-esr/browser/extensions/${id}.xpi"
}
