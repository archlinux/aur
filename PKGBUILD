# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Piero Sartini <piero@sartini.de>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: knut
# Contributor: kxmd

pkgname=squeak-vm
pkgver=4.10.2.2614
pkgrel=6
pkgdesc="Full-featured implementation of the Smalltalk programming language and environment"
arch=('x86_64')
url="http://squeakvm.org"
license=('custom:MIT' 'APACHE')
depends=('libgl' 'libpulse' 'libxrender')
makedepends=('cmake') 
source=(http://squeakvm.org/unix/release/Squeak-$pkgver-src.tar.gz)
md5sums=('8a5cb1d6899d55df56154fab8716e034')
sha256sums=('3db6d12ea223e5bc49f52af7f6f832e383a3a006a53bc8a87f6469e1af5dfc2e')

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
