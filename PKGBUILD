# Maintainer:
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=longloops
pkgver=1.0.1
pkgrel=4
pkgdesc="Brain-stretching game in which you must build loops out of sections of pipe"
arch=('i686' 'x86_64')
url="https://launchpad.net/longloops/"
license=('GPL3')
depends=('gtk2' 'gtkmm')
makedepends=('intltool' 'gendesk')
source=("https://launchpad.net/%7Emusic1/+archive/ppa/+files/longloops_$pkgver.orig.tar.gz")
sha256sums=('77a3d68d49ec7725a67dde7f614ae34cfbfc5e67a4e7aaeaa1d5e783ead619d4')

prepare() {
  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc" --genericname=Longloops
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/doc "$pkgdir"/usr/share/
  install -Dm644 ../longloops.desktop "$pkgdir"/usr/share/applications/longloops.desktop
  install -Dm644 src/icon.xpm "$pkgdir"/usr/share/pixmaps/longloops.xpm
}
