# Maintainer: revel <revelΘmuub·net>
# Contributor: Paul Ezvan <paul@ezvan.fr>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=jrtplib
pkgver=3.10.0
pkgrel=1
pkgdesc='An object-oriented RTP library written in C++'
arch=('i686' 'x86_64')
url='http://research.edm.uhasselt.be/jori/page/CS/Jrtplib.html'
license=('MIT')
#options=('!libtool')
depends=('jthread>=1.3.1')
makedepends=('cmake')
source=("http://research.edm.uhasselt.be/jori/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('431b743692aff13b6d16469082220f67c16c02dde71decb5a9fa8d3e7d763fab')

build() {
  cd "$pkgname-$pkgver"
#  ./configure --prefix=/usr
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DLIBRARY_INSTALL_DIR:PATH=lib
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
