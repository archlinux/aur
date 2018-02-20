# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=onedrive
pkgver=1.1.1
pkgrel=1
pkgdesc='Free OneDrive client written in D'
arch=('i686' 'x86_64')
url='https://github.com/skilion/onedrive'
license=('GPL3')
depends=('curl' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('dmd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/skilion/onedrive/archive/v$pkgver.tar.gz")
sha256sums=('fb51c81ec95c28f3fe3b29e3b7f915e30161bd5f4b14bb53ae5c2233cc1e92e9')

prepare() {
  printf 'v%s\n' "$pkgver" > $pkgname-$pkgver/version
  sed -i '/^onedrive:/ s/version //' $pkgname-$pkgver/Makefile
}

build() {
  make PREFIX=/usr -C $pkgname-$pkgver
}

package() {
  make PREFIX=/usr DESTDIR="$pkgdir" -C $pkgname-$pkgver install
  install -Dm644 $pkgname-$pkgver/config "$pkgdir/usr/share/onedrive/config.default"
}
