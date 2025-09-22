# Maintainer: 
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>

pkgname=manaplus
pkgver=2.1.3.17
pkgrel=2
pkgdesc="Free OpenSource 2D MMORPG client for Evol Online, The mana world and similar servers"
arch=('x86_64')
url="https://manaplus.org/"
license=('GPL')
depends=('glu' 'libxml2' 'physfs' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'sdl_gfx' 'curl')
makedepends=('mesa')
replaces=('tmw')
source=($pkgname-$pkgver.tar.gz::https://github.com/ManaPlus/ManaPlus/archive/v$pkgver.tar.gz
        0000-add-missing-cstdint.patch
        0001-fix-missing-ctime.patch
        0002-fix-new-libxml2.patch)
sha256sums=('5506a283e4df6ea96750347dc1b67d8f71421acff8070a13a15c00960b16c9f7'
            'a0ad6d079ee70796810215d1e17e4e8c8a00381053def52fd7b5ad89f85aa16f'
            'bb033746059e5fb7de64d4fce2215a6612c1d027ec1bd553fafb63cab0daab5f'
            'd063fd9045b296801800064ca77b41ec896dc6a537f97d5a0797c0b1e1e63121')

prepare() {
  cd ManaPlus-$pkgver

  for patch in ../*.patch; do
    patch -Np1 -i "$patch"
  done

  autoreconf -i
}

build() {
  cd ManaPlus-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ManaPlus-$pkgver

  make DESTDIR="${pkgdir}" install
}
