# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=synthclone
pkgver=0.3.0
pkgrel=2
pkgdesc='A tool to automate sampling of MIDI-capable instruments.'
arch=('i686' 'x86_64')
url="https://github.com/surfacepatterns/synthclone/"
license=('GPL' 'LGPL')
depends=('libarchive' 'libzip' 'lilv' 'portaudio' 'portmidi' 'qt4' 'suil')
makedepends=('python2' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/surfacepatterns/synthclone/archive/version-$pkgver.tar.gz")
md5sums=('a06ca9aa52ea98af19cb6c8d6872e3c3')

prepare() {
  cd "$srcdir/$pkgname-version-$pkgver"

  # python2 fix
  sed -i "s/env python$/&2/" configure install/build-*
}

build() {
  cd "$srcdir/$pkgname-version-$pkgver"

  ./configure --prefix=/usr --skip-api-docs=1
  # rebuild Makefiles for Qt4
  find src -name Makefile -exec rm -f {} \;
  make QMAKE=qmake-qt4
}

package() {
  cd "$srcdir/$pkgname-version-$pkgver"

  make install INSTALL_ROOT="$pkgdir/"
}
