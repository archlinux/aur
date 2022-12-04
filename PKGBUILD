# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=bzflag
pkgver=2.4.26
pkgrel=1
pkgdesc='Multiplayer 3D tank battle game'
url='https://bzflag.org/'
license=('LGPL')
arch=('x86_64')
depends=('curl' 'glew' 'glu' 'sdl2' 'c-ares')
source=("https://download.bzflag.org/bzflag/source/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('01830405ff26ad1dc595a7e0695c824c2786e678868d9ff822aeb14ac7481014')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
  cd misc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 misc/bzflag.desktop "${pkgdir}"/usr/share/applications/bzflag.desktop
  install -Dm644 data/bzflag-48x48.png "${pkgdir}"/usr/share/pixmaps/bzflag-48x48.png
}
