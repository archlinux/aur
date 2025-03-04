# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Forked from Firefox package

pkgname=librewolf-decentraleyes
pkgver=3.0.0
_commit=852627c493902dfda50271fe592b784f41fafb71
pkgrel=1
pkgdesc='Local emulation of Content Delivery Networks'
url=https://decentraleyes.org/
arch=('any')
license=('MPL-2.0')
groups=('librewolf-addons')
makedepends=('git' 'npm' 'strip-nondeterminism' 'zip')
source=("git+https://git.synz.io/Synzvato/decentraleyes.git#commit=$_commit?signed")
b2sums=('SKIP')
validpgpkeys=('A6B7BA10893FE67EE17A9F8FCECC45E1E979013C') # Thomas Rientjes <synzvato@protonmail.com>

check() {
  cd decentraleyes/auditor
  npm install
  node run
}

package() {
  cd decentraleyes
  install -d "$pkgdir"/usr/lib/librewolf/browser/extensions
  zip -r \
    "$pkgdir"/usr/lib/librewolf/browser/extensions/jid1-BoFifL9Vbdl2zQ@jetpack.xpi \
    * -x '.git*' 'audit/*' crowdin.yaml
  strip-nondeterminism -t zip "$pkgdir"/usr/lib/librewolf/browser/extensions/*.xpi
}

# vim:set ts=2 sw=2 et:

