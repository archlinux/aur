# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=chkservice
pkgver=0.3
pkgrel=3
pkgdesc="Systemd units manager with ncurses, terminal interface"
arch=('x86_64')
url="https://github.com/linuxenko/chkservice"
license=('GPL3')
depends=('systemd')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
        get-state.patch)
sha256sums=('56037fd82be06d6115d0738439c23faa291d036ffe33fe590b484b045d6d180d'
            '3db092cd91bf14ab35db55e692249ba0b08277fce99614812a5d5f0a5d0980c9')

prepare() {
  patch --directory=$pkgname-$pkgver --forward --strip=1 --input="$srcdir/get-state.patch"
}

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  install -Dm644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}

