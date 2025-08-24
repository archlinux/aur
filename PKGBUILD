# Maintainer: Network Jack <Network_Jack@null.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eli schwartz <eschwartz@archlinux.org>
# Fork of Arch Firefox package

pkgname=librewolf-noscript
pkgver=13.0.9
pkgrel=1
pkgdesc="Extension for librewolf which disables javascript"
arch=('any')
url="https://noscript.net/"
license=('GPL2')
checkdepends=('jq')
groups=('librewolf-addons')
source=("noscript-${pkgver}.xpi::https://noscript.net/download/releases/noscript-$pkgver.xpi")
noextract=("noscript-${pkgver}.xpi")
sha256sums=('525ab61aff21f67d10c3e20965a86ed479631549908a658f54692adc47d771f5')
b2sums=('88cfab7daeb0287b4ccbf80875e41ca57969cfa92d575f83e253c1294719d4162f25e0499bfab8feb8838df93e0a2576ec5bcb6513dcd2d8e8117bcf3aa1a60a')

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

