# $Id$

pkgname=hunspell-ru-aot
_realname=dict_ru_ru-aot
pkgver=0.3.9
_pkgver=0-3-9
pkgrel=1
pkgdesc="Russian spellcheck dictionary. Based on works of AOT.ru group. Dictionary «only yo»."
provides=('hunspell-ru')
conflicts=('hunspell-ru')
replaces=('hunspell-ru')
arch=(any)
url="http://extensions.libreoffice.org/extension-center/russian-spellcheck-dictionary.-based-on-works-of-aot-group"
license=('LGPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=(http://extensions.libreoffice.org/extension-center/russian-spellcheck-dictionary.-based-on-works-of-aot-group/pscreleasefolder.2011-09-06.6209385965/${pkgver}/${_realname}-${_pkgver}.oxt)
#source=(http://extensions.libreoffice.org/extension-center/russian-dictionary-pack/releases/0.3.8/dict_pack_ru-aot-0-3-8.oxt)
md5sums=('1c5e5fb1dc441da3b132d22bb067de79')

build() {
  /bin/true
}

package() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m 644 russian-aot.dic $pkgdir/usr/share/hunspell/ru_RU.dic
  install -m 644 russian-aot.aff $pkgdir/usr/share/hunspell/ru_RU.aff

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
