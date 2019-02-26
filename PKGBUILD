# Maintainer: adament <adament@adament.net>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=hunspell-da
pkgver=2.4
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url="http://www.stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("https://extensions.libreoffice.org/extensions/stavekontrolden-danish-dictionary/${pkgver}/@@download/file/dict-da-${pkgver/./-}.oxt")
sha256sums=('c08a7c53dcbae49f5ebb3274e673ec983f623f52c9f8d6f471887de7e4a62476')

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
