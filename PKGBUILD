# Maintainer : ksj <podhorsky.ksj@gmail.com>

pkgname=lifeograph
pkgver=1.4.0
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
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")

sha256sums=('66555240f7d26e3f3b8184216d0f11a781a3c6b794cf2ea818b6be6e5ed0e536')

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
