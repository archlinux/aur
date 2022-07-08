# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Mamba
pkgname="${_projectname,,}"
pkgver=2.3
pkgrel=3
pkgdesc='A virtual MIDI keyboard and file player/recorder for ALSA/JACK'
arch=(i686 x86_64 aarch64)
url="https://github.com/brummer10/$_projectname"
license=(BSD)
depends=(cairo)
makedepends=(alsa-lib fluidsynth jack liblo libsigc++ libsmf xxd)
optdepends=('new-session-manager: for NSM support')
groups=(pro-audio)
source=("https://github.com/brummer10/Mamba/releases/download/v$pkgver/${_projectname}_$pkgver.tar.gz")
sha256sums=('c12ce0721a2924eb38d86f511115fedaeef0dfe09a9fabc2d7ee8e94497d2dd9')

build() {
  cd ${_projectname}_$pkgver
  make
}

package() {
  depends+=(libasound.so libfluidsynth.so libjack.so liblo.so libsigc-2.0.so libsmf.so)
  cd ${_projectname}_$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
