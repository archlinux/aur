# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=wla-dx
pkgname="${_pkgname/-/_}"
pkgver=9.7
pkgrel=1
pkgdesc='Multi Platform Cross Assembler Package for GB-Z80 (Game Boy), Z80 (GG, SMS, MSX, Spectrum, Ti86, etc), 6502 (NES, etc), 65C02 (VIC-20, etc), 6510 (C64, etc), 65816 (SNES, etc), HUC6280 (PC-Engine) and SPC-700 (SNES sound chip)'
url='https://github.com/vhelin/wla-dx'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/vhelin/wla-dx/archive/v$pkgver.tar.gz")
sha512sums=('58c46c8bdf4b4c3d40a48b9fd94c13aea9c176ba674e26ba48fa07707f0e5b7975bc474ba73fbdcf331b113cf1fcdec667a04f6caff1c07d063972676adc8b04')

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
