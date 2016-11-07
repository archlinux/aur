# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname='hunspell-pt_pt'
_pkgname='hunspell-pt_PT'
pkgver=20161001
pkgrel=1
pkgdesc="Portuguese (European, post-orthographic agreement) hunspell dictionaries"
arch=('any')
url="http://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/"
license=('GPL' 'LGPL' 'MPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("http://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/$_pkgname-$pkgver.tar.gz")
sha512sums=('cd954db7f3909b0f50c3a71f19e4bd3f05194d11b740f3703e9aabc059fa8ed965263cd56276f70de5e2e366551becdb3c2b3a92eba87d7a68fa62251eb08441')
PKGEXT='.pkg.tar'

build() {
  /bin/true
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -dm755 $pkgdir/usr/share/hunspell
  install -m644 pt_PT.* $pkgdir/usr/share/hunspell

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
