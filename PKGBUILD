# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Bogdanov <andorn@gmail.com>

pkgname=kchmviewer
pkgver=5.1
pkgrel=1
pkgdesc="A .chm files (MS HTML help file format) viewer"
arch=('i686' 'x86_64')
url="http://kchmviewer.sourceforge.net/"
license=('GPL')
depends=('chmlib' 'kdelibs' 'qt' 'xdg-utils')
makedepends=('automoc4' 'cmake')
options=('libtool')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)

md5sums=('9b68c3e233fe3d8e16251ba95526a493')

build() {
  cd ${srcdir}/build-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=${pkgdir} install

#icon file
  install -D -m644 ${srcdir}/build-$pkgver/packages/$pkgname.png \
    ${pkgdir}/usr/share/pixmaps/$pkgname.png || return 1

#msits.protocol file provided by kdegraphics package
  rm -rf ${pkgdir}/usr/share/kde4 || return 1
#kio_msits.so file provided by kdegraphics package - FS#14376
  rm -rf ${pkgdir}/usr/lib || return 1
}
