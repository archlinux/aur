# Maintainer : ksj <podhorsky.ksj@gmail.com>

pkgname=lifeograph
pkgver=1.3.0
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

sha256sums=('fe595f00d2b32917cd307bd18f3489589baf6e813eca8083f0d408a13ba5b3f3')

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
