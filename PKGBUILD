# $Id$
# Maintainer: adament <adament@adament.net>

pkgname=hunspell-da
pkgver=2.2
pkgrel=2
pkgdesc="Danish hunspell dictionaries"
arch="any"
url="http://www.stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=(http://extensions.libreoffice.org/extension-center/stavekontrolden-danish-dictionary/pscreleasefolder.2011-09-30.0280139318/$pkgver/dict-da-${pkgver/./-}.oxt)
sha256sums=('16e0bc0ae9cf90b141b69e45f7d56a61d6629542661bea03d79efb8912a5938f')

package() {
  cd "$srcdir"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 da_DK.dic da_DK.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd
}
