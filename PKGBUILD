# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
# Based on hunspell-fr PKGBUILD

pkgname=hunspell-fr-revised-base
pkgver=6.0.2
pkgrel=1
pkgdesc="French (1990 reform) hunspell dictionary. No symlink (fr_BE, fr_CA, etc.)"
arch=(any)
url="http://www.dicollecte.org/"
license=('custom:MPLv2')
optdepends=('hunspell: the spell checking libraries and apps')
provides=('hunspell-fr')
source=(http://www.dicollecte.org/download/fr/hunspell-french-dictionaries-v${pkgver}.zip
        LICENSE)
sha256sums=('434956a8f572494718a7d7e79af1d778a6a0192936305daa74e2ada297327af8'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')
package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-reforme1990.dic ${pkgdir}/usr/share/hunspell/fr_FR.dic
  install -m644 fr-reforme1990.aff ${pkgdir}/usr/share/hunspell/fr_FR.aff

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs
  install -Dm644 README_dict_fr.txt "${pkgdir}"/usr/share/doc/${pkgname}/README_dict_fr.txt

  # license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
