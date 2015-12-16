# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: said
# Contributor: Milos Kaurin <milos dot kaurin gmail>

pkgname=java-p7zip-binding
pkgver=9.20_2.00beta
_pkgver=9.20-2.00beta
pkgrel=1
pkgdesc="Java wrapper for 7-Zip C++ library."
arch=('i686' 'x86_64')
url="https://github.com/borisbrodski/sevenzipjbinding"
license=('LGPL')
depends=('java-runtime')
makedepends=('cmake' 'java-environment')
source=(https://github.com/borisbrodski/sevenzipjbinding/archive/Release-$_pkgver.tar.gz)
md5sums=('42f091aa8a1fa84260a55bcaa0381f6c')

build() {
  cd "$srcdir"/sevenzipjbinding-Release-$_pkgver
  cmake .
  make 7-Zip-JBinding
  make sevenzipjbinding-jar
  make sevenzipjbinding-lib-jar
}

package() {
  cd "$srcdir"/sevenzipjbinding-Release-$_pkgver
  if [ "$CARCH" = "i686" ]; then
    install -Dm755 Linux-i386/lib7-Zip-JBinding.so "$pkgdir/usr/lib/lib7-Zip-JBinding.so"
    install -Dm644 sevenzipjbinding-Linux-i386.jar "$pkgdir/usr/share/java/sevenzipjbinding-Linux-i386.jar"
  elif [ "$CARCH" = "x86_64" ]; then
    install -Dm755 Linux-amd64/lib7-Zip-JBinding.so "$pkgdir/usr/lib/lib7-Zip-JBinding.so"
    install -Dm644 sevenzipjbinding-Linux-amd64.jar "$pkgdir/usr/share/java/sevenzipjbinding-Linux-amd64.jar"
  else
    echo "Wrong architecture type. Check your PKGBUILD"
  return 1
  fi
}

