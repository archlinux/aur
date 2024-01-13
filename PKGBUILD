# Contributor: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-localcdn
pkgver=2.6.62
_commit=1c7511f63e7048f5891d583ceb50e27479c141b8
pkgrel=1
pkgdesc='LocalCDN addon for Firefox'
arch=('any')
url=https://www.localcdn.org/
license=('MPL2')
groups=('firefox-addons')
makedepends=('git' 'zip' 'strip-nondeterminism')
source=("git+https://codeberg.org/nobody/LocalCDN.git#commit=$_commit?signed")
b2sums=('SKIP')
validpgpkeys=('3F59043BE267E1B1177688AC8F6DE3D614FCFD7A') # nobody <nfo@localcdn.org>

package() {
  cd LocalCDN
  install -d "$pkgdir"/usr/lib/firefox/browser/extensions
  zip -r \
    "$pkgdir/usr/lib/firefox/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi" \
    * -x '.git*' 'audit/*'
  strip-nondeterminism -t zip "$pkgdir"/usr/lib/firefox/browser/extensions/*.xpi

  # create symlink for librewolf
  # install -d "$pkgdir/usr/lib/librewolf/browser/extensions/" && ln -sf "/usr/lib/firefox/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi"
}
