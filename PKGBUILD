# Maintainer: Liliane Fontenot <projects@liliane.io>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=bzflag
pkgver=2.4.30
pkgrel=1
pkgdesc='Multiplayer 3D tank battle game'
url='https://bzflag.org/'
license=('MPL-2.0 OR LGPL-2.1-only')
arch=('x86_64')
depends=('curl' 'glew' 'glu' 'sdl2' 'c-ares')
source=("https://download.bzflag.org/bzflag/source/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('bb78b750e7bce7aa7c11bd35906bb08a49acc7c50bf29629af380eecd153894d')

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
