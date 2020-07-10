# Maintainer: adament <adament@adament.net>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=hunspell-da
pkgver=2.6.1
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url="http://www.stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("da_DK-${pkgname}-${pkgver}.oxt::https://stavekontrolden.dk/dictionaries/da_DK/da_DK.oxt")
sha256sums=('0ea3b76abf59306834a9e01010362700029bbffc7268706c91b2ea1438847138')

package() {
  cd "$srcdir"
  cp "da_DK-${pkgname}-${pkgver}.oxt" "da_DK.oxt"
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
