# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=5.3
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('chmlib' 'kdelibs' 'qt' 'xdg-utils')
makedepends=('automoc4' 'cmake')
options=('libtool')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('a8666e63358d20d6ead6b9f309434bdfcbd7b869ed7fb425ca8e0a2f7166af22')

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=${pkgdir} install

#icon file
  install -D -m644 ${srcdir}/$pkgname-$pkgver/packages/$pkgname.png \
    ${pkgdir}/usr/share/pixmaps/$pkgname.png

#msits.protocol file provided by kdegraphics package
  rm -rf ${pkgdir}/usr/share/kde4
#kio_msits.so file provided by kdegraphics package - FS#14376
  rm -rf ${pkgdir}/usr/lib
}
