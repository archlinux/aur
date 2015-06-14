# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=doctotext-bin
_pkgname=doctotext
pkgver=4.0
_pkgver=838
pkgrel=1
pkgdesc='A powerful utility that can convert documents in many formats to plain text.'
arch=('i686' 'x86_64')
url='http://silvercoders.com/en/products/doctotext/'
license=('GPL')
depends=(libxml2 gcc-libs)
options=(!strip)
install=''
#CARCH=x86_64
case $CARCH in
  i686)
    _arch=x86
    source=(http://silvercoders.com/download/doctotext-${pkgver}.${_pkgver}-${_arch}-linux.tar.bz2)
    sha256sums=('10e9e666993b151447dc76003c78763c67bd99590cb4801db2b62be31e7b8ee6')
    ;;
  x86_64)
    _pkgver=882
    _arch=$CARCH
    source=(http://silvercoders.com/download/doctotext-${pkgver}.${_pkgver}-${_arch}-linux.tar.bz2)
    sha256sums=('c9683d6fc588c75173d1ee263c37b7ba0e26af8347f7b538ae24d976563d88a8')
    ;;
esac
package(){
  cd "$srcdir"/$_pkgname

  install -dm755 $pkgdir/opt/doctotext
  cp -r ./ $pkgdir/opt/doctotext/
  install -Dm755 doctotext.sh $pkgdir/usr/bin/doctotext

  sed -e 's#\.#/opt/doctotext#' -e 's#\./#/opt/doctotext/#' -i \
    $pkgdir/usr/bin/doctotext
}
