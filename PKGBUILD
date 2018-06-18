# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Paul Dino Jones "ZitZ" <Raptorman18@gmail.com>

pkgname=openjazz
pkgver=20180522
pkgrel=1
pkgdesc="A free, open-source version of the classic Jazz Jackrabbit™ games"
arch=('i686' 'x86_64')
url="http://alister.eu/jazz/oj/"
license=('GPL')
depends=('zlib' 'sdl' 'libmodplug')
install=openjazz.install
source=("https://github.com/AlisterT/openjazz/releases/download/$pkgver/openjazz-$pkgver.tar.xz")
sha256sums=('35260066f307ff7e31304907a2a430a20b8d1fa5f90ad2c13275ab3aca337c24')

prepare() {
  # look in home directory for data files
  sed 's|"/."|"/.openjazz/"|' -i $pkgname-$pkgver/src/main.cpp
}

build() {
  cd $pkgname-$pkgver
  export CPPFLAGS="$CPPFLAGS -DDATAPATH=\\\"/usr/share/openjazz/\\\" -DHOMEDIR"
  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
