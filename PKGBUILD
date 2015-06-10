# Maintainer:  kfgz <kfgz at interia pl>
# Contributor: Allan McRae <allan at archlinux dot org>
# Contributor: Tom Newsom <Jeepster at gmx dot co dot uk>

pkgname=xdelta
pkgver=1.1.4
pkgrel=5
pkgdesc='Binary file delta generator'
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/xdelta/"
license=('GPL')
depends=('glib' 'zlib')
options=('!libtool')
source=("http://xdelta.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        'xdelta-1.1.4-aclocal.patch')
sha256sums=('345503b60432812840991ea1d79cb10db5f34bfaba9499bd0e7d5c57ac5d5c6d'
            '8a3e06cfef18ed4e976daecab0e4ebdea20dd849136ef919787f4444b8f89f2d')

build() {
  cd ${pkgname}-${pkgver}

  patch -Np1 -i "${srcdir}"/xdelta-1.1.4-aclocal.patch
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  make -C ${pkgname}-${pkgver} DESTDIR=${pkgdir} install
}

