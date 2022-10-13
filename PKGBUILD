# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname=mythes-uk
_srcver=7.4.2
_srcrel=1
pkgver=${_srcver//[~-]/_}
pkgrel=${_srcrel}.1
pkgdesc="Ukrainian thesaurus"
arch=(any)
url='http://ftp.br.debian.org/debian/pool/main/libr/libreoffice-dictionaries'
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
source=(${url}/${pkgname}_${_srcver}-${_srcrel}_all.deb)
sha256sums=('5b1b6aadc2ae205d50fafeda69989b47125575c492ca08c00ace451fa1ecb943')
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
