# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=giada
pkgname="${_pkgname}-vst"
pkgver=0.14.6
pkgrel=1
pkgdesc="A looper, drum machine, sequencer, live sampler and plugin host (VST enabled)"
arch=('i686' 'x86_64')
url="http://www.giadamusic.com/"
license=('GPL3')
depends=('fltk' 'jansson' 'libpulse' 'libxpm' 'rtmidi')
makedepends=('steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-src.tar.gz::http://www.giadamusic.com/download/grab/source"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
md5sums=('f5610aa6bf82b3749290b88746e1dec3'
         '06238158680470ab01fbbeb33353e58e'
         'f9b6e4233890720af50c536c4b2c92c0')
changelog='ChangeLog'

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-src"

  export CXXFLAGS="$CXXFLAGS -Wno-error"
  ./configure --prefix=/usr --target=linux --enable-vst
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-src"

  export CXXFLAGS="$CXXFLAGS -Wno-error"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
