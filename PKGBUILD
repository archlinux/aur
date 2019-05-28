# Maintainer:  Björn Bidar <theodorstormgrade@gmail.com>
_pkgname=qzxing
pkgname=$_pkgname-git
pkgver=05fdc3.r191.g961e24f
pkgrel=1
pkgdesc="Qt/QML wrapper library for the ZXing library. 1D/2D barcode image processing library"
arch=('i686' 'x86_64')
url="https://github.com/ftylitak/qzxing"
license=('Apache')
depends=('qt5-multimedia' 'qt5-declarative')
makedepends=('git')
provides=($_pkgname)
conflicts=($pkgname)
source=($_pkgname::git+https://github.com/Thaodan/qzxing#branch=wip_qml_plugin)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  mkdir -p "$srcdir"/build
  cd "$srcdir"/build
  qmake -makefile ../"$_pkgname"/src/QZXing.pro \
        PREFIX=/usr \
        CONFIG="qzxing_multimedia plugin"
  make PREFIX=/usr
}


package() {
  cd "$srcdir"/build
  make install INSTALL_ROOT="$pkgdir"
}

# vim:set ts=2 sw=2 et:
