# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Mamba
pkgname="${_projectname,,}"
pkgver=2.0
pkgrel=1
pkgdesc="A virtual MIDI keyboard and file player/recorder for ALSA/JACK"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/${_projectname}"
license=('0BSD')
depends=('cairo')
makedepends=('alsa-lib' 'fluidsynth' 'jack' 'liblo' 'libsigc++' 'libsmf')
optdepends=('new-session-manager: for NSM support')
groups=('pro-audio')
source=(
    "https://github.com/brummer10/${_projectname}/releases/download/v${pkgver}/${_projectname}_${pkgver}.tar.gz"
)
sha256sums=('9f28e7145bb3d0a1954bc9de619fb7d1d6b4c5f02e6bd4d9097b0db6f2a66aec')


prepare() {
  cd "${srcdir}/${_projectname}_${pkgver}"
  sed -i '/update-desktop-database/d' src/Makefile
}

build() {
  cd "${srcdir}/${_projectname}_${pkgver}"
  make
}

package() {
  depends+=('libasound.so' 'libfluidsynth.so' 'libjack.so' 'liblo.so' 'libsigc++' 'libsmf.so')
  cd "${srcdir}/${_projectname}_${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
