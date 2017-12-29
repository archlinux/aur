# Maintainer: ainola
# Contributor: fledge (Giorgio Daino)
pkgname=residualvm
pkgver=0.3.0
pkgrel=1
pkgdesc="A cross-platform 3D game interpreter which allows you to play LucasArts LUA-based 3D adventures."
arch=('x86_64')
license=('LGPL')
url="http://www.residualvm.org/"
depends=('sdl2' 'libmad' 'libmpeg2' 'libvorbis' 'hicolor-icon-theme'
         'libjpeg-turbo' 'alsa-lib' 'glew' 'freetype2')
optdepends=('fluidsynth: for MIDI SoundFont2 support')
source=("https://github.com/residualvm/residualvm/archive/$pkgver.tar.gz")
sha256sums=('45d86430475f1a17923d2d19ee08433269dd5da850352baf550bb7461f6aba1c')

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
