# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname=mythes-uk
_srcver=7.2.0
_srcrel=2
pkgver=${_srcver}
pkgrel=${_srcrel}.1
pkgdesc="Ukrainian thesaurus"
arch=(any)
url='http://ftp.br.debian.org/debian/pool/main/libr/libreoffice-dictionaries'
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
source=(${url}/${pkgname}_${_srcver}-${_srcrel}_all.deb)
sha256sums=('4fe423b464bc141cfca9f1186b2559a3aa9f5c12919cfcee09f065562bc676f5')
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
