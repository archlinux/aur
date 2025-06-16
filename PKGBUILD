# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eli schwartz <eschwartz@archlinux.org>
# Fork of Arch Firefox package

pkgname=librewolf-noscript
pkgver=13.0.8
pkgrel=1
pkgdesc="Extension for librewolf which disables javascript"
arch=('any')
url="https://noscript.net/"
license=('GPL2')
checkdepends=('jq')
groups=('librewolf-addons')
source=("noscript-${pkgver}.xpi::https://noscript.net/download/releases/noscript-$pkgver.xpi")
noextract=("noscript-${pkgver}.xpi")
sha256sums=('9d978cfe083cb9cce120b5ee41e8933d752d7ab4680bf517c5ec4b29c4cfd2dc')
b2sums=('e82150826cac8cb87e3f2a9ff2c61e052818d378352634b9182ec3c1eea9a9bf7d0f517a81fb822cb1bdc033e8f7ebe8b60ffa99b549f188f8cfd6852f1e4be3')


check() {
  bsdtar xf noscript-$pkgver.xpi manifest.json
  jq '.version' manifest.json | grep -E '^"'$pkgver'"$'
}

package() {
  depends=('librewolf')
  _extension_id="{73a6fe31-595d-460b-a920-fcc0f8843232}"
  _extension_dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_extension_id}"
  install -Dm644 noscript-${pkgver}.xpi "${_extension_dest}.xpi"
}

