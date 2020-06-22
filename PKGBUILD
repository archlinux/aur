# Maintainer: adament <adament@adament.net>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=hunspell-da
pkgver=2.5.102
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url="http://www.stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK.oxt")
b2sums=('b399f4b605e89aea256e0ee4224e20196f0f89ea041f5e8178ab81cc6e89184bfd86b5c58d6fab5de5548ebd1b10d3445f12ae4128cfcdcc581560fe87e338ed')

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
