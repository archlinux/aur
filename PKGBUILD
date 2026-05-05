# Maintainer: Network Jack <Network_Jack@null.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eli schwartz <eschwartz@archlinux.org>
# Fork of Arch Firefox package

pkgname=librewolf-noscript
pkgver=13.6.6
pkgrel=1
pkgdesc="Extension for librewolf which disables javascript"
arch=('any')
url="https://noscript.net/"
license=('GPL2')
checkdepends=('jq')
groups=('librewolf-addons')
source=("noscript-${pkgver}.xpi::https://noscript.net/download/releases/noscript-$pkgver.xpi")
noextract=("noscript-${pkgver}.xpi")
sha256sums=('2059e638f3944cc323e76a3c0d727af530192bd5e425f0f6ea740c0b2e7054b1')
b2sums=('debb2dfdb69476e79f4fd7b5eb723ce2409748f42e19c2e61c4186232c0b813b2939a113acfdf205f516b9eef110b661d51f456a0c8b9d5be661bca35ba90a30')



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

