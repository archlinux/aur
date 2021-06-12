# Maintainer: revel <revelΘmuub·net>
# Contributor: Paul Ezvan <paul@ezvan.fr>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=jrtplib
pkgver=3.11.2
pkgrel=1
pkgdesc='An object-oriented RTP library written in C++'
arch=('i686' 'x86_64')
url='http://research.edm.uhasselt.be/jori/page/CS/Jrtplib.html'
license=('MIT')
#options=('!libtool')
depends=('jthread>=1.3.1')
makedepends=('cmake')
source=("http://research.edm.uhasselt.be/jori/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('2c01924c1f157fb1a4616af5b9fb140acea39ab42bfb28ac28d654741601b04c')

build() {
  cd "$pkgname-$pkgver"
#  ./configure --prefix=/usr
  CPPFLAGS="-std=gnu++98" cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIBRARY_INSTALL_DIR:PATH=lib
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
