# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=wla-dx
pkgname="${_pkgname/-/_}"
pkgver=10.3
pkgrel=1
pkgdesc='Multi Platform Cross Assembler Package for GB-Z80 (Game Boy), Z80 (GG, SMS, MSX, Spectrum, Ti86, etc), 6502 (NES, etc), 65C02 (VIC-20, etc), 6510 (C64, etc), 65816 (SNES, etc), HUC6280 (PC-Engine) and SPC-700 (SNES sound chip)'
url='https://github.com/vhelin/wla-dx'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('cmake' 'python-sphinx')
source=("https://github.com/vhelin/wla-dx/archive/v$pkgver.tar.gz")
sha512sums=('189e2f91262795b81306298ee8ca10cdd4dd5dfa2df6295b2f03d350e4c3604cd6e57a9b47e266c5fac05555789116996d847f6f1d8b9ff0963b12ec8ea1eed8')

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
