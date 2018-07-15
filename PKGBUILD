# Maintainer: Lionel Miller <delonorm at gmail dot com>

pkgname=dendrix
pkgver=0.3
pkgrel=2
pkgdesc="Algorithm for discovery of mutated driver pathways in cancer using only mutation data"
arch=('any')
url="http://compbio.cs.brown.edu/projects/dendrix/"
license=('custom')
depends=('python2')
source=("$pkgname-$pkgver.zip::http://compbio-research.cs.brown.edu/software/Dendrix/Dendrix_v$pkgver.zip")
sha512sums=('39fd7983b34c25b5e69ed230d9f4da2795fb64057c9891afa136953855391cd8d019ac5cdfc28b69a931852b8dca381ebd01bf93c3cd7c53ab7b36f967479f7b')

prepare() {
  cd Dendrix

  sed -e "s:#!/usr/bin/env python:#!/usr/bin/env python2:" \
      -e "s:README.txt:/usr/share/doc/$pkgname/README.txt:" \
      -i Dendrix.py -i PermutationTestDendrix.py
  sed -e "s/python Dendrix.py/dendrix/" -i Dendrix.py
  sed -e "s/python permutationTestDendrix.py/permutation_test_dendrix/" -i PermutationTestDendrix.py
}

package() {
  cd Dendrix

  install -Dm755 Dendrix.py "$pkgdir/usr/bin/dendrix"
  install -Dm755 PermutationTestDendrix.py "$pkgdir/usr/bin/permutation_test_dendrix"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/share/$pkgname/"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"

  cp README.txt RELEASE_NOTES.txt "$pkgdir/usr/share/doc/$pkgname/"
  cp -r example/ "$pkgdir/usr/share/$pkgname/"
}
