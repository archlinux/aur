# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>
pkgname=mythes-uk
_srcver=7.4.0~rc2
_srcrel=4
pkgver=${_srcver//[~-]/_}
pkgrel=${_srcrel}.1
pkgdesc="Ukrainian thesaurus"
arch=(any)
url='http://ftp.br.debian.org/debian/pool/main/libr/libreoffice-dictionaries'
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
source=(${url}/${pkgname}_${_srcver}-${_srcrel}_all.deb)
sha256sums=('a9adba50e3c7149bc055b8614eb1bedadf801b356b6a77d79b03a02ef02f6852')
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
