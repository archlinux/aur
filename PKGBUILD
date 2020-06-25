# Maintainer: adament <adament@adament.net>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=hunspell-da
pkgver=2.5.103
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url="http://www.stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK.oxt")
b2sums=('994b66fb5117fc591a99dbeed9872532b18397c4b54dcd0389822026d6155a406867b3585c57094609d4b790c5a09bb79200ac3bb2eee53b16ed3054d0e3c6ee')

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
