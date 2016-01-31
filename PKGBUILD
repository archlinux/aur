# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=synthclone
pkgver=0.3.0
pkgrel=1
pkgdesc='A tool to automate sampling of MIDI-capable instruments.'
arch=('i686' 'x86_64')
url="http://code.google.com/p/synthclone/"
license=('GPL' 'LGPL')
depends=('qt4' 'libzip' 'portaudio' 'portmidi' 'lilv' 'suil')
makedepends=('python2' 'doxygen')
install="$pkgname.install"
source=("http://synthclone.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('14069c0676f758cfc2d75f7da200c930')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  sed -i "s/env python$/&2/" configure install/build-*
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --skip-api-docs=1
  # rebuild Makefiles for Qt4
  find src -name Makefile -exec rm -f {} \;
  make QMAKE=qmake-qt4
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install INSTALL_ROOT="$pkgdir/"
}
