# Maintainer: Johann Rohwer <j.m.rohwer at gmail dot com>

pkgname=hyphen-af
pkgver=2020.02.14
pkgrel=1
pkgdesc="Afrikaans hyphenation rules"
arch=('any')
url="https://github.com/LibreOffice/dictionaries"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=('https://raw.githubusercontent.com/LibreOffice/dictionaries/master/af_ZA/hyph_af_ZA.dic' 'https://raw.githubusercontent.com/LibreOffice/dictionaries/master/af_ZA/README_af_ZA.txt')
sha512sums=('eb15678d0faa89b16e9a47eebbad6a8533e3255677e09760e1fca38170f85ee387b4d9fb7a3ae143121212bf257c3166677a7a00ec11fd4c439012fa407f80be' '5c4a50d90139f78475691fe8c7b1524126e8ddedfbb5671f182afed0359eb94fcf79bc5e7e579b5025a47e814829d33ce9b1ae20d261ffc696d2f59fba6beb40')

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hyphen
  install -m644 hyph_af_ZA.dic ${pkgdir}/usr/share/hyphen/hyph_af_ZA.dic

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd

  # license
  install -D -m644 README_af_ZA.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
