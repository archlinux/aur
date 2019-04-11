# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=libsigrok
pkgver=0.5.1
pkgrel=4
pkgdesc='Client software that supports various hardware logic analyzers, core library'
arch=('x86_64')
url='https://www.sigrok.org/wiki/Libsigrok'
license=('GPL3')
depends=('libftdi' 'libserialport' 'glibmm' 'libzip' 'libieee1284')
makedepends=('cmake' 'doxygen' 'ruby' 'jdk8-openjdk' 'swig' 'python' 'pygobject-devel' 'python-numpy' 'python-setuptools')
optdepends=('python' 'ruby' 'jdk8-openjdk')
source=("https://sigrok.org/download/source/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('48337fc4625dc0abc162ae54e04ce091047835aa1e49ba1ab84542805008d1ff5646b143fde57e317f3b34514c0e6d4dcb7b1c5944f3f16bdef1a7169edc3517')

build() {
  cd $pkgname-$pkgver

 ./configure --prefix=/usr

  make
}

package() {
  cd libsigrok-$pkgver

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -m644 -D contrib/60-libsigrok.rules $pkgdir/usr/lib/udev/rules.d/60-libsigrok.rules
  install -m644 -D contrib/61-libsigrok-uaccess.rules $pkgdir/usr/lib/udev/rules.d/61-libsigrok-uaccess.rules
}

