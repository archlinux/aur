# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=wla-dx
pkgname="${_pkgname/-/_}"
pkgver=10.7
pkgrel=1
pkgdesc='Multi Platform Cross Assembler Package for GB-Z80 (Game Boy), Z80 (GG, SMS, MSX, Spectrum, Ti86, etc), 6502 (NES, etc), 65C02 (VIC-20, etc), 6510 (C64, etc), 65816 (SNES, etc), HUC6280 (PC-Engine) and SPC-700 (SNES sound chip)'
url='https://github.com/vhelin/wla-dx'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('cmake' 'python-sphinx')
source=("https://github.com/vhelin/wla-dx/archive/v$pkgver.tar.gz")
sha512sums=('0fababcf70524d7ac235b586066f76e664edcb742433016e96a20a58e185e820299495bb6650295c4de884bfec1ada8650bc917c7a01ccbcd8653a740244703f')

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
