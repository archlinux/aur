# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor:  kfgz <kfgz at interia pl>
# Contributor: Allan McRae <allan at archlinux dot org>
# Contributor: Tom Newsom <Jeepster at gmx dot co dot uk>

pkgname=xdelta
pkgver=1.1.4
pkgrel=7
pkgdesc='Binary file delta generator'
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/xdelta/"
license=('GPL')
depends=('glib' 'zlib')
options=('!libtool')
#source=("http://xdelta.googlecode.com/files/$pkgname-$pkgver.tar.gz")
#source=("http://download.openpkg.org/components/cache/$pkgname/$pkgname-$pkgver.tar.gz")
source=("https://github.com/bbidulock/xdelta/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        'xdelta-1.1.4-aclocal.patch')
sha256sums=('345503b60432812840991ea1d79cb10db5f34bfaba9499bd0e7d5c57ac5d5c6d'
            '8a3e06cfef18ed4e976daecab0e4ebdea20dd849136ef919787f4444b8f89f2d')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -b -z .orig <../xdelta-1.1.4-aclocal.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make  DESTDIR="${pkgdir}" install
}

