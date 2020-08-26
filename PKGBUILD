# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=plib
pkgver=1.8.5
pkgrel=9
pkgdesc="Set of libraries to write games and other realtime interactive applications"
arch=('x86_64' 'aarch64')
url="http://plib.sourceforge.net/"
license=('custom:LGPL')
makedepends=('mesa' 'libxi' 'libxmu')
source=(
  http://plib.sourceforge.net/dist/$pkgname-$pkgver.tar.gz
  'config.guess::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
  'config.sub::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD'
)
options=('staticlibs')
md5sums=(
  '47a6fbf63668c1eed631024038b2ea90'
  'SKIP'
  'SKIP'
)

prepare() {
  cd ${srcdir}/$pkgname-$pkgver

  cp ../config.guess .
  cp ../config.sub .
}

build() {
  cd ${srcdir}/$pkgname-$pkgver

  CXXFLAGS=-fPIC CFLAGS=-fPIC LDFLAGS=-fPIC ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}
