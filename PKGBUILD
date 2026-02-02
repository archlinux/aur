# Maintainer: Pedro Cunha <arch [at] pyker [dot] net>
# Contributor: Mauro Santos <registo.mailling@gmail.com>

pkgname='hunspell-pt_pt'
_pkgname='hunspell-pt_PT'
pkgver=20251001
pkgrel=1
pkgdesc="Portuguese (European, post-orthographic agreement) hunspell dictionaries"
arch=('any')
url="https://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/"
license=('GPL' 'LGPL' 'MPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("https://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/$_pkgname-$pkgver.tar.gz")
sha256sums=('2066157087e83264484a6d564e1d85258fe2c5eddb9713a42d6f6cf06b0a2ed9')

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
