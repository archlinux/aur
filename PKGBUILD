# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='hunspell-pt_pt-preao'
_pkgname='hunspell-pt_PT-preao'
pkgver=20161001
pkgrel=1
pkgdesc="Portuguese (European, pre-orthographic agreement) hunspell dictionaries"
arch=('any')
url="http://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/"
license=('GPL' 'LGPL' 'MPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("http://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/$_pkgname-$pkgver.tar.gz")
sha512sums=('8278a2135e61d8f115d62e066b1aa920d3281257b5c78721c6dfec19bd7841326612ddd367f4913fba55571458ec5c231c0213f456a1ba094971d2792cf271cf')
PKGEXT='.pkg.tar'

build() {
  /bin/true
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -dm755 $pkgdir/usr/share/hunspell
  install -m644 pt_PT-preao.* $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_pt_PT.txt $pkgdir/usr/share/doc/$pkgname

  # licences
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -m644 COPYING $pkgdir/usr/share/licenses/$pkgname
}
