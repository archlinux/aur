# Maintainer: Johann Rohwer <j.m.rohwer at gmail dot com>

pkgname=hunspell-af
pkgver=2020.02.14
pkgrel=1
pkgdesc='Afrikaans dictionary for Hunspell'
arch=('any')
url="https://github.com/LibreOffice/dictionaries"
license=('LGPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=('https://raw.githubusercontent.com/LibreOffice/dictionaries/master/af_ZA/af_ZA.aff' 'https://raw.githubusercontent.com/LibreOffice/dictionaries/master/af_ZA/af_ZA.dic' 'https://raw.githubusercontent.com/LibreOffice/dictionaries/master/af_ZA/README_af_ZA.txt')
sha512sums=('55183d82cdcfea24c5a2c5ebf2acbf6ee8954f4a220f65e3bfcbd63c348a8d5fe2eb17608ae794005a36e8c12b5587c960dd3cb23ffaf449ff2a1bfcff350b66' '3ed02cad12f799899ca900bc59231c32179e040b4339e99f38c131db2777007dad3e3105a72ad499eeffa176bc52c519b1a71698a6f3518693a4e60aace7cde2' '5c4a50d90139f78475691fe8c7b1524126e8ddedfbb5671f182afed0359eb94fcf79bc5e7e579b5025a47e814829d33ce9b1ae20d261ffc696d2f59fba6beb40')

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell

  install -m644 af_ZA.dic ${pkgdir}/usr/share/hunspell/af_ZA.dic
  install -m644 af_ZA.aff ${pkgdir}/usr/share/hunspell/af_ZA.aff

  # myspell symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd

  # docs
  install -D -m644 README_af_ZA.txt ${pkgdir}/usr/share/doc/${pkgname}/README
  
  # license
  install -D -m644 README_af_ZA.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
