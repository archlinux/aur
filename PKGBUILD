# Maintainer: Prurigro

_pkgname=wla-dx
pkgname=wla_dx
pkgver=9.6
pkgrel=1
pkgdesc="Multi Platform Cross Assembler Package for GB-Z80 (Game Boy), Z80 (GG, SMS, MSX, Spectrum, Ti86, etc), 6502 (NES, etc), 65C02 (VIC-20, etc), 6510 (C64, etc), 65816 (SNES, etc), HUC6280 (PC-Engine) and SPC-700 (SNES sound chip)"
url="https://github.com/vhelin/wla-dx"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('bash')
source=("https://github.com/vhelin/wla-dx/archive/v$pkgver.tar.gz")
sha512sums=('9d1c570f74e33e07d5f27d7ba28e8bde045d6e78c2a8ff57f2aa78583e03ed1fbec19ae54ff98f9e8764fd2720be52acc6f838ec9704f8a3e1022b533fa247f1')

build() {
  cd $_pkgname-$pkgver
  unset CFLAGS
  export CC=gcc LD=gcc
  sh unix.sh $(cat /proc/cpuinfo | grep "cpu cores" -m 1 | egrep -o [0-9]*$)
}

package() {
  # Install assemblers
  install -d "$pkgdir/usr/bin"
  install -m755 $_pkgname-$pkgver/binaries/* "$pkgdir/usr/bin/"

  # Install supplimentary files
  install -d "$pkgdir/usr/share"{/doc/,/}$_pkgname
  cp -R $_pkgname-$pkgver/txt/* "$pkgdir/usr/share/doc/$_pkgname/"
  cp -R $_pkgname-$pkgver/examples "$pkgdir/usr/share/$_pkgname/"
  cp -R $_pkgname-$pkgver/memorymaps "$pkgdir/usr/share/$_pkgname/"
  cp -R $_pkgname-$pkgver/makefiles "$pkgdir/usr/share/$_pkgname/"
  find "$pkgdir/usr/share" -type f -exec chmod 644 '{}' \;
  find "$pkgdir/usr/share" -type d -exec chmod 755 '{}' \;
}
