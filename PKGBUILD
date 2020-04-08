# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Piero Sartini <piero@sartini.de>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: knut
# Contributor: kxmd

pkgname=squeak-vm
pkgver=4.10.2.2614
pkgrel=5
pkgdesc="Full-featured implementation of the Smalltalk programming language and environment"
arch=('x86_64')
url="http://squeakvm.org"
license=('custom:MIT' 'APACHE')
depends=('libgl' 'libpulse' 'libxrender')
makedepends=('cmake') 
source=(http://squeakvm.org/unix/release/Squeak-$pkgver-src.tar.gz)
md5sums=('8a5cb1d6899d55df56154fab8716e034')

build() {
  cd Squeak-$pkgver-src/

  ./unix/cmake/configure --prefix=/usr --without-quartz --with-x \
    --enable-mpg-mmx

  make
}

package() {
  cd Squeak-$pkgver-src  

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/Squeak-$pkgver-src/unix/doc/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
