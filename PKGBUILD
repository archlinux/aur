# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname=mythes-uk
_srcver=7.4.1
_srcrel=1
pkgver=${_srcver//[~-]/_}
pkgrel=${_srcrel}.1
pkgdesc="Ukrainian thesaurus"
arch=(any)
url='http://ftp.br.debian.org/debian/pool/main/libr/libreoffice-dictionaries'
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
source=(${url}/${pkgname}_${_srcver}-${_srcrel}_all.deb)
sha256sums=('5f3cbe6b937bfff6c529a3e25563b0c8d34c00904d01a2cc2f3ab0701b7e2abd')
package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/mythes/*; do
      ln -sv /usr/share/mythes/$(basename $file) .
    done
  popd
}
