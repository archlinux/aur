# Maintainer: adament <adament@adament.net>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=hunspell-da
pkgver=2.5.105
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url="http://www.stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK.oxt")
b2sums=('327e53b888ca8ff6632bc6f409ad9d8aa3f342af4d22a2502e40ddcb0ce1181f76ee978911ce01530910e4ad21ad7d3f50cf2b7f8ae6429eecedb8c5025eb383')

package() {
  cd "$srcdir"
  install -dm755 "${pkgdir}"/usr/share/hunspell
  install -m644 da_DK.dic da_DK.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
  for file in $pkgdir/usr/share/hunspell/*; do
    ln -sv /usr/share/hunspell/"$(basename $file)" .
  done
  popd
}
