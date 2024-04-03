pkgname=hyphen-el
pkgver=7.6.6
_pkgver=7.6.6.3
pkgrel=1
pkgdesc="Greek hyphenation rules"
arch=('any')
url="https://www.documentfoundation.org/"
license=('LGPL')
optdepends=('hyphen: offers hyphenation library functions')
source=(https://download.documentfoundation.org/libreoffice/src/${pkgver}/libreoffice-dictionaries-${_pkgver}.tar.xz)
md5sums=('be17b656407ad1ff80510998895624aa')

package() {
  cd "${srcdir}"

  install -dm755 ${pkgdir}/usr/share/hyphen

  install -m644 libreoffice-${_pkgver}/dictionaries/el_GR/hyph_el_GR.dic "${pkgdir}/usr/share/hyphen/hyph_el_GR.dic"

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hyphen/*; do
      ln -sv /usr/share/hyphen/$(basename $file) .
    done
  popd

  # docs
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 libreoffice-${_pkgver}/dictionaries/el_GR/README_el_GR.txt "${pkgdir}/usr/share/doc/${pkgname}/README_el_GR.txt"
}
