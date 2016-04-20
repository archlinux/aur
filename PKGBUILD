# Maintainer: Reihar <reihar [at] necronomicon [dot] fr>
#Package based on hunspell-fr pagkaged created by Guillaume ALAUX

pkgname=hunspell-fr-cpr90
pkgver=5.6
pkgrel=1
pkgdesc="French (Classic + 1990 Reform) hunspell dictionaries"
arch=(any)
url="http://www.dicollecte.org/"
license=('custom:MPLv2')
optdepends=('hunspell:	the spell checking libraries and apps')
provides=('hunspell-fr')
conflicts=('hunspell-fr')
source=(http://www.dicollecte.org/download/fr/hunspell-french-dictionaries-v${pkgver}.zip
        LICENSE)
sha256sums=('0e3e27aac53b60590dcd33a0bae32df58d767d5b0e0fbf0c4b23c755e87987c3'
            'fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85')

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 fr-toutesvariantes.dic ${pkgdir}/usr/share/hunspell/fr_FR.dic
  install -m644 fr-toutesvariantes.aff ${pkgdir}/usr/share/hunspell/fr_FR.aff

  pushd ${pkgdir}/usr/share/hunspell/
  fr_FR_aliases="fr_BE fr_CA fr_CH fr_LU"
  for lang in ${fr_FR_aliases}; do
	ln -s fr_FR.aff ${lang}.aff
	ln -s fr_FR.dic ${lang}.dic
  done

  popd

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd
  
  # docs
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 README_dict_fr.txt $pkgdir/usr/share/doc/${pkgname}/README_dict_fr.txt
  
  #license
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
 
