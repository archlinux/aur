# Maintainer: ainola <opp310@alh.rqh> (ROT13)
# Contributor: fledge (Giorgio Daino) <g.daino@teletu.it>
pkgname=residualvm
pkgver=0.2.1
pkgrel=1
pkgdesc="A cross-platform 3D game interpreter which allows you to play LucasArts LUA-based 3D adventures."
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.residualvm.org/"
depends=('sdl' 'libmad' 'libmpeg2' 'libvorbis' 'hicolor-icon-theme' 
         'libjpeg-turbo' 'alsa-lib' 'gcc-libs')
optdepends=('fluidsynth: for MIDI SoundFont2 support')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-sources.tar.bz2)
sha256sums=('cd2748a665f80b8c527c6dd35f8435e718d2e10440dca10e7765574c7402d924')
install="residualvm.install"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --disable-debug \
              --enable-release \
              --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 "dists/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "icons/${pkgname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/residualvm.png"
  install -Dm644 "icons/${pkgname}-big.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/residualvm.png"
}
