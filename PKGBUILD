# Maintainer: Lionel Miller <delonorm at gmail dot com>

pkgname=dendrix
pkgver=0.3
pkgrel=1
pkgdesc="Algorithm for discovery of mutated driver pathways in cancer using only mutation data"
arch=('any')
url="http://compbio.cs.brown.edu/projects/dendrix/"
license=('MIT')
depends=('python2')
provides=('dendrix')
source=("$pkgname-$pkgver.zip::http://compbio-research.cs.brown.edu/software/Dendrix/Dendrix_v$pkgver.zip")
sha512sums=('39fd7983b34c25b5e69ed230d9f4da2795fb64057c9891afa136953855391cd8d019ac5cdfc28b69a931852b8dca381ebd01bf93c3cd7c53ab7b36f967479f7b')

prepare() {
  cd Dendrix

  sed -e "s:#!/usr/bin/env python:#!/usr/bin/env python2:" \
      -i Dendrix.py -i PermutationTestDendrix.py
}

package() {
  cd Dendrix
  install -Dm755 Dendrix.py "$pkgdir/usr/bin/Dendrix.py"
  install -Dm755 PermutationTestDendrix.py "$pkgdir/usr/bin/PermutationTestDendrix.py"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/$pkgname/"
  cp -r README.txt RELEASE_NOTES.txt example/ "$pkgdir/usr/share/$pkgname/"
}
