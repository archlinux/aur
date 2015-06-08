# Maintainer: Reihar <reihar [at] necronomicon [dot] fr>
#Package based on hunspell-fr pagkaged created by Guillaume ALAUX

pkgname=hunspell-fr-cpr90
pkgver=5.3
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
md5sums=('697fc4c3d61a029694fbe13a84ed37cd'
         '815ca599c9df247a0c7f619bab123dad')

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
 
