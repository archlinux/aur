# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname=mythes-uk
_srcver=7.0.1
_srcrel=1
pkgver=${_srcver}
pkgrel=${_srcrel}.1
pkgdesc="Ukrainian thesaurus"
arch=(any)
url='http://ftp.br.debian.org/debian/pool/main/libr/libreoffice-dictionaries'
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
source=(${url}/${pkgname}_${_srcver}-${_srcrel}_all.deb)
sha256sums=('e2faa78ad2a7c270ad8345bf8a1ef9f005d2a926630448d44d3ea24daebff950')
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
