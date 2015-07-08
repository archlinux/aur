pkgname=hyphen-el
pkgver=1.1b
pkgrel=2
pkgdesc="Greek hyphenation rules"
arch=('any')
url="http://ispell.math.upatras.gr"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(http://ispell.math.upatras.gr/files/ooffice/hyph_el.zip)
md5sums=('f4eae38b3b3c6b043089c3e7e6176a2d')

package() {
  cd "${srcdir}"

  install -dm755 ${pkgdir}/usr/share/hyphen

  install -m644 hyph_el.dic "${pkgdir}/usr/share/hyphen/hyph_el_EL.dic"

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd

  # docs
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README_hyph_el.txt "${pkgdir}/usr/share/doc/${pkgname}/README_hyph_el_EL.txt"
}