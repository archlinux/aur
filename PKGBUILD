# $Id$
# Maintainer: adament <adament@adament.net>

pkgname=hunspell-da
pkgver=2.3
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url="http://www.stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("https://extensions.libreoffice.org/extensions/stavekontrolden-danish-dictionary/${pkgver}/@@download/file/dict-da-${pkgver/./-}.oxt")
sha256sums=('ecc4cb145d0a14403d5ec39b9fd398307fa66b3d6329b979a39de3edaeac5d15')

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
