# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cc65
pkgver=2.17
pkgrel=1
pkgdesc='C compiler for 6502 family microprocessors'
arch=('i686' 'x86_64')
license=('BSD')
url='https://cc65.github.io/cc65/'
source=(https://github.com/cc65/cc65/archive/V${pkgver}.tar.gz cc65.sh)
sha512sums=('b0208db2919e789322c609044c7eb6eae74905f3ec2d25688adc6c1ebe774cd437b0bc73c28032f123ed22ea544550cdd72ae1bc28e3aa7eea8cad3780f56828'
            'eb45cf08a0fdc85ce34535447add9bcf4139e5515af229f16608b94f2a1cb8ab3cba4d79652212244f0657902c0a3768352f9a2bde7891f6e462a1e01d9dee6b')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "../cc65.sh" "$pkgdir/etc/profile.d/cc65.sh"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}
