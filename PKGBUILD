# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=6.0
pkgrel=3
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('desktop-file-utils' 'chmlib' 'kdebase-runtime' 'xdg-utils')
makedepends=('automoc4' 'cmake')
options=('libtool')
install=$pkgname.install
changelog=$pkgname.changelog
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('81c856434a86977039c36cb10f2427cc8cb1ea29a778f24fff2285d49c717979')

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

#msits.protocol file provided by kdegraphics-okular package
  rm -rf ${pkgdir}/usr/share/kde4
#kio_msits.so file provided by kdegraphics-okular package - FS#14376
  rm -rf ${pkgdir}/usr/lib
}
