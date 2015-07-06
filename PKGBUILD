# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=petri-foo
pkgver=0.1.87
pkgrel=2
pkgdesc="A fork of specimen, a MIDI controllable audio sampler, for JACK."
arch=('i686' 'x86_64')
url="http://petri-foo.sourceforge.net/"
license=('GPL2')
depends=('jack' 'libgnomecanvas')
makedepends=('cmake')
optdepends=('liblo: Non Session Manager support')
install='petri-foo.install'
source=(http://sourceforge.net/projects/${pkgname}/files/Source/${pkgname}-${pkgver}.tar.bz2
        petri-foo-0.1.87_fix_recent_file_not_exist.patch)
md5sums=('40f8a224368187672f9f306f8a4fa8c5'
         '964db40cc53d77d42f6593f2201b9c40')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../../petri-foo-0.1.87_fix_recent_file_not_exist.patch
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUpdateMime:BOOL=OFF .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
