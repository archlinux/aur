# Maintainer: Johann Rohwer <j.m.rohwer at gmail dot com>

pkgname=hunspell-af
pkgver=2024.02.13
pkgrel=1
pkgdesc='Afrikaans dictionary for Hunspell'
arch=('any')
url="https://github.com/LibreOffice/dictionaries"
license=('LGPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=(
    'https://raw.githubusercontent.com/LibreOffice/dictionaries/master/af_ZA/af_ZA.aff'
    'https://raw.githubusercontent.com/LibreOffice/dictionaries/master/af_ZA/af_ZA.dic'
    'https://raw.githubusercontent.com/LibreOffice/dictionaries/master/af_ZA/README_af_ZA.txt'
    )
sha512sums=(
    'dccce77b7d1b6bd82f938976fdd02603c2e40ac77bd1c6b5a038165d9102b375f532fc00ab8bb13fd360a48489a493ecd46cf4037d89d2d746f467be23ab423e'
    '0bce1e0d71c10a7dad5d7a36bbd3f2bf1177a59323e4d98b1bedd500fd3e2e5af0949e1fa5a6f5bd65248416ade6978f7266e9c3c76d94c93ab9e04ac4f055b3'
    '5c4a50d90139f78475691fe8c7b1524126e8ddedfbb5671f182afed0359eb94fcf79bc5e7e579b5025a47e814829d33ce9b1ae20d261ffc696d2f59fba6beb40'
    )

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
