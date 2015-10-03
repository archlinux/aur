# $Id$

pkgname=('hyphen-lt')
pkgver=0.1
pkgrel=2
pkgdesc="Lithuanian hyphenation rules"
arch=(any)
url="http://wiki.services.openoffice.org/wiki/Dictionaries"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(http://sunsite.informatik.rwth-aachen.de/ftp/pub/mirror/OpenOffice/contrib/dictionaries/hyph_lt_LT.zip)

md5sums=('6d90a1e831f639137077879dacb596cb')


build() {
  /bin/true
}


package() {

  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/hyphen
  #cp -p hyph_lt_LT.dic $pkgdir/usr/share/hyphen
  install -m 644 hyph_lt_LT.dic $pkgdir/usr/share/hyphen

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  install -m 644 README_hyph_lt_LT.txt $pkgdir/usr/share/doc/$pkgname
}

