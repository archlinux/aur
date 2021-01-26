# Maintainer: aksel <aksel@akseltorgard.com>
# Based on hunspell-* PKGBUILDs

pkgname=hunspell-fo
pkgver=0.4.2
pkgrel=1
pkgdesc="Faroese hunspell dictionaries"
arch=('any')
url="https://fo.speling.org/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("${pkgname}-${pkgver}.tar.gz::https://fo.speling.org/filer/myspell-fo-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/myspell-fo-${pkgver}"
  install -dm755 "${pkgdir}"/usr/share/hunspell
  install -m644 fo_FO.dic fo_FO.aff $pkgdir/usr/share/hunspell

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
  for file in $pkgdir/usr/share/hunspell/*; do
    ln -sv /usr/share/hunspell/"$(basename $file)" .
  done
  popd
}
