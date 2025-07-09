# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=plib
pkgver=1.8.5
pkgrel=10
pkgdesc="Set of libraries to write games and other realtime interactive applications"
arch=('x86_64' 'aarch64')
url="https://plib.sourceforge.net/"
license=('custom:LGPL')
makedepends=('mesa' 'libxi' 'libxmu')
source=(
  http://plib.sourceforge.net/dist/$pkgname-$pkgver.tar.gz
  'config.guess' # https://gitweb.git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD
  'config.sub' # https://gitweb.git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD
)
options=('staticlibs')
md5sums=(
  '47a6fbf63668c1eed631024038b2ea90'
  '11714d3cd0a013dc3a7fd350d3a67066'
  'cf258f914ddb13bb4cfa8a5d60f951b5'
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
