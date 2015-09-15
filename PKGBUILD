# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor: Milos Kaurin <milos dot kaurin gmail>

pkgname=java-p7zip-binding
pkgver=4.65_1.06rc
pkgver1_=4.65-1.06-rc   # helper var for the download filename
pkgver2_=4.65-1.06rc    # same as above
pkgrel=1
pkgdesc="Java wrapper for 7-Zip C++ library."
arch=('i686' 'x86_64')
url="http://sevenzipjbind.sourceforge.net/"
license=('LGPL')
depends=('java-runtime')
makedepends=('unzip' 'java-environment')
source=(http://downloads.sourceforge.net/project/sevenzipjbind/7-Zip-JBinding/$pkgver2_-extr-only/sevenzipjbinding-$pkgver1_-extr-only-AllLinux.zip)
md5sums=('45e6c9859f507321216192ba6207ad25')

package() {
  cd $srcdir
  unzip -oqq sevenzipjbinding-$pkgver1_-extr-only-AllLinux.zip
  cd sevenzipjbinding-$pkgver1_-extr-only-AllLinux/lib
  jar xf sevenzipjbinding-AllLinux.jar
  m_arch=`uname -m`
  if [ "$m_arch" = "i686" ]; then
    install -Dm755 Linux-i386/lib7-Zip-JBinding.so "$pkgdir/$J2REDIR/lib/i386/lib7-Zip-JBinding.so"
  elif [ "$m_arch" = "x86_64" ]; then
    install -Dm755 Linux-amd64/lib7-Zip-JBinding.so "$pkgdir/$J2REDIR/lib/amd64/lib7-Zip-JBinding.so"
  else
    echo "Wrong architecture type. Check your PKGBUILD"
  return 1
  fi
}
