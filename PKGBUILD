# Maintainer: 
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Jesse McClure <jesse [dot] mcclure [at] umassmed [dot] edu>

pkgname=manaplus
pkgver=2.1.3.17
pkgrel=1
pkgdesc="Free OpenSource 2D MMORPG client for Evol Online, The mana world and similar servers"
arch=('x86_64')
url="https://manaplus.org/"
license=('GPL')
depends=('glu' 'libxml2' 'physfs' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'sdl_gfx' 'curl')
makedepends=('mesa')
replaces=('tmw')
source=($pkgname-$pkgver.tar.gz::https://github.com/ManaPlus/ManaPlus/archive/v$pkgver.tar.gz
        add-missing-cstdint-include.patch
        fix-missing-ctime-include.patch)
sha256sums=('5506a283e4df6ea96750347dc1b67d8f71421acff8070a13a15c00960b16c9f7'
            '6aa4cc2f236923e9d36b4068b292c1072ca22c6cef1bae5c20f0f6cc0f1ca183'
            '59b8c096c89f033bdd92f23ae2217055fb60b18d1bc6b1d521a510ed3aec7ae6')

prepare() {
  cd ManaPlus-$pkgver

  patch -Np1 -i ${srcdir}/add-missing-cstdint-include.patch
  patch -Np1 -i ${srcdir}/fix-missing-ctime-include.patch

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
