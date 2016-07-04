# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>

pkgname=freesynd
pkgver=0.7.5
pkgrel=1
pkgdesc="A free, cross-platform reimplementation of the classic Bullfrog game 'Syndicate'"
url="http://freesynd.sourceforge.net/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('sdl_mixer' 'sdl_image')
makedepends=('cmake')
install=$pkgname.install
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1a1611cdc3af5659fcc3f6c1db5e4895e67b5a7b22c55416ffeeedd6360080e3')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package () {
  cd $pkgname-$pkgver

  make -C build DESTDIR="$pkgdir/" install

  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 AUTHORS INSTALL NEWS README freesynd.ini "$pkgdir"/usr/share/doc/$pkgname
}
