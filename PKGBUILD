# Maintainer : itsme <mymail@ishere.ru>

pkgname=lifeograph
pkgver=1.4.2
pkgrel=1
pkgdesc="off-line and private journal and note taking application"
arch=('i686' 'x86_64')
license=('GNU GPL v3')
url="https://launchpad.net/lifeograph"
depends=('gtkmm3' 'enchant' 'libgcrypt')
makedepends=('cmake' 'intltool')
optdepends=()
install=$pkgname.install
options=('!emptydirs' '!makeflags')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2")

sha256sums=('c7ff8930fb2c3935435ad3ecc513587ace9b14dac157b3d5cbaef8729393f7b0')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make  DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/$pkgname-$pkgver/build/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
