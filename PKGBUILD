# $Id$

pkgname=('hyphen-ru')
pkgver=0.1
pkgrel=2
pkgdesc="Russian hyphenation rules"
arch=(any)
url="http://wiki.services.openoffice.org/wiki/Dictionaries"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(#http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/hyph_ru_RU.zip
# mirror from ApacheOpenOffice - see: http://www.openoffice.org/distribution/mirrors/master.html
http://sunsite.informatik.rwth-aachen.de/ftp/pub/mirror/OpenOffice/contrib/dictionaries/hyph_ru_RU.zip)

md5sums=('f8a8b8a368bc7394b5a4060082c44bb4')


build() {
  /bin/true
}


package() {

  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/hyphen
  #cp -p hyph_ru_RU.dic $pkgdir/usr/share/hyphen
  install -m 644 hyph_ru_RU.dic $pkgdir/usr/share/hyphen

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  install -m 644 README_hyph_ru_RU.txt $pkgdir/usr/share/doc/$pkgname
}

