# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eli schwartz <eschwartz@archlinux.org>
# Fork of Arch Firefox package

pkgname=librewolf-noscript
pkgver=12.1.1
pkgrel=1
pkgdesc="Extension for librewolf which disables javascript"
arch=('any')
url="https://noscript.net/"
license=('GPL2')
checkdepends=('jq')
groups=('librewolf-addons')
source=("noscript-${pkgver}.xpi::https://noscript.net/download/releases/noscript-$pkgver.xpi")
noextract=("noscript-${pkgver}.xpi")
sha256sums=('f9639e63ffcfc352036de00e4ff6694bb0ca65a0bb8fbd103bd08f32dc1ff31a')
b2sums=('3f59366f936e9b706b33811e8d9a31e8e512ae6650f5d4e8d0d9582cb518ae1903c17b5251785a4bd6dd6c1318e2a77cf556e99c588c947ef616b336fadace3a')

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

