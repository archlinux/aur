# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Mamba
pkgname="${_projectname,,}"
pkgver=2.2
pkgrel=2
pkgdesc="A virtual MIDI keyboard and file player/recorder for ALSA/JACK"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/${_projectname}"
license=('0BSD')
depends=('cairo')
makedepends=('alsa-lib' 'fluidsynth' 'jack' 'liblo' 'libsigc++' 'libsmf' 'xxd')
optdepends=('new-session-manager: for NSM support')
groups=('pro-audio')
source=("https://github.com/brummer10/Mamba/files/6329780/${_projectname}_${pkgver}.tar.gz")
sha256sums=('974403e08ab5d0bc92dcfad7cfdc4c95df87c5d8ca586794923bdb2254569838')


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
