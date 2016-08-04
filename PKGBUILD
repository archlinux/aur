# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=pacpak
pkgver=0.2
pkgrel=1
pkgdesc="Create Flatpak apps from pacman packages"
arch=('any')
url="https://pelzflorian.de/git/pacpak/"
license=('GPL3')
depends=('flatpak' 'fakeroot' 'fakechroot')
source=("https://pelzflorian.de/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6776aa516d339c867d90e3310adba24dab0edd3eda6f2347134fc9e36ec2ceacdf3b47e7e1562dd1668b2720e69fc01c6af6093bb8e686a30c6de92a5728ca0a')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
