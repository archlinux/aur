# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=wla-dx
pkgname="${_pkgname/-/_}"
pkgver=10.2
pkgrel=1
pkgdesc='Multi Platform Cross Assembler Package for GB-Z80 (Game Boy), Z80 (GG, SMS, MSX, Spectrum, Ti86, etc), 6502 (NES, etc), 65C02 (VIC-20, etc), 6510 (C64, etc), 65816 (SNES, etc), HUC6280 (PC-Engine) and SPC-700 (SNES sound chip)'
url='https://github.com/vhelin/wla-dx'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('cmake' 'python-sphinx')
source=("https://github.com/vhelin/wla-dx/archive/v$pkgver.tar.gz")
sha512sums=('cf11cbab78c96bdcc00518855ec34b1157c3d6be2642708c4325bdcdfc377a05a9e4d3ce24837df32a1fa992dad4932a8f57db9175c2b1470b135f3bd231bdfb')

build() {
  cd $_pkgname-$pkgver
  cmake -G 'Unix Makefiles'
}

package() {
  cd $_pkgname-$pkgver
  unset CFLAGS
  export CC=gcc LD=gcc
  make DESTDIR="$pkgdir" install

  # Install to /usr not /usr/local
  cd "$pkgdir"
  mv usr temp
  mv temp/local usr
  rmdir temp

  # Move the man directory to the correct location
  mv usr/man usr/share/man
}
