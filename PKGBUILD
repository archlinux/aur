# $Id$

pkgname=hunspell-ru-aot-ieyo
pkgver=0.3.9
pkgrel=1
pkgdesc="Russian hunspell dictionary"
provides=('hunspell-ru')
conflicts=('hunspell-ru')
arch=(any)
url="http://extensions.openoffice.org/en/projectrelease/russkiy-orfograficheskiy-slovar-aot-eyo-russian-spellcheck-dict-ieyo-based-works"
#"http://forumooo.ru/index.php/topic,106.0.html"
license=('LGPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("http://downloads.sourceforge.net/project/aoo-extensions/5149/3/dict_ru_ru-aot-${pkgver}-ieyo.oxt")

package() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m 644 russian-aot-ieyo.dic $pkgdir/usr/share/hunspell/ru_RU.dic
  install -m 644 russian-aot-ieyo.aff $pkgdir/usr/share/hunspell/ru_RU.aff

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  install -m 644 copyright.txt $pkgdir/usr/share/doc/$pkgname
  install -m 644 lgpl.txt $pkgdir/usr/share/doc/$pkgname
}

md5sums=('ad19073f05e62294295be1749ba2c3b2')
