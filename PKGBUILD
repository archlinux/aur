# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: muflax <muflax@gmail.com>
# Contributor: Adrian Siekierka <kontakt@asie.pl>

pkgname=robotfindskitten
pkgver=2.7182818.701
pkgrel=2
pkgdesc='Yet another zen simulation'
arch=('x86_64' 'i686')
url='http://www.robotfindskitten.org/'
license=('GPL2')
depends=("ncurses")
makedepends=('setconf')
install="$pkgname.install"
options=('zipman')
source=("http://robotfindskitten.org/download/POSIX/$pkgname-$pkgver.tar.gz")
sha256sums=('7749a370796fd23e3b306b00de5f7fb7997a35fef30e3910ff159448c932d719')

prepare() {
  cd "$pkgname-$pkgver"

  setconf src/Makefile.in execgamesdir '$(prefix)/bin'
}

build() {
  cd "$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make prefix="$pkgdir/usr" install
  install -Dm644 nki/vanilla.nki "$pkgdir/usr/share/games/robotfindskitten/vanilla.nki"
}

# vim:set ts=2 sw=2 et:
