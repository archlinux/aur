# Maintainer: SpacingBat3 <git@spacingbat3.anonaddy.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>

pkgname=manaplus-sdl2
pkgver=2.1.3.17
pkgrel=2
pkgdesc="Free OpenSource 2D MMORPG client for Evol Online, The mana world and similar servers. SDL2 version."
arch=('x86_64')
url="https://manaplus.org/"
license=('GPL')
depends=('glu' 'libxml2' 'physfs' 'sdl2_'{'image','mixer','net','ttf','gfx'} 'curl')
makedepends=('mesa')
provides=('manaplus'=$pkgver)
conflicts=('manaplus')
replaces=('tmw')
source=($pkgname-$pkgver.tar.gz::https://github.com/ManaPlus/ManaPlus/archive/v$pkgver.tar.gz
        fix-various-compiler-errors.patch)
sha256sums=('5506a283e4df6ea96750347dc1b67d8f71421acff8070a13a15c00960b16c9f7'
            'd7522ab604193a5c82bfbfc85cdb106a2f4803a647985bcb00fa71719dd3c8ab')
b2sums=('8b046f45b009a294084ea6239974ef9dabb618947955e5c89edd6b77b4520d2f38cdb1e21fd30aa20e5155bd9f01d81501fae477708b076ca8729ba3b4424e08'
        'f991f89408b1c6e7d4184a5d0cd702b60920b053675586a5b6b626aab046acc7a794addaa022154609cae839af66cd15138b83f62058713ca300a87aefccfba8')


prepare() {
  cd ManaPlus-$pkgver

  patch -Np1 -i ${srcdir}/${source[1]}

  autoreconf -i
}

build() {
  cd ManaPlus-$pkgver

  ./configure --prefix=/usr --with-sdl2
  make
}

package() {
  cd ManaPlus-$pkgver

  make DESTDIR="${pkgdir}" install
}
