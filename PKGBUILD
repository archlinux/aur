# $Id$

pkgname=hunspell-ru-aot
_realname=dict_ru_ru-aot
pkgver=0.4.5
pkgrel=1
pkgdesc="Russian spellcheck dictionary. Based on works of AOT.ru group. Dictionary «only yo»."
provides=('hunspell-ru')
conflicts=('hunspell-ru')
replaces=('hunspell-ru')
arch=(any)
#url="https://extensions.libreoffice.org/extensions/russian-spellcheck-dictionary.-based-on-works-of-aot-group"
url="https://extensions.libreoffice.org/en/extensions/show/russian-spellcheck-dictionary.-based-on-works-of-aot-group"
license=('LGPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=(https://extensions.libreoffice.org/assets/downloads/48/${_realname}-${pkgver}.oxt)
sha256sums=('dfba6bf1c50e41653d720fc9bc5806232600c13a00730240b8d5d192af1ee1be')

package() {
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
