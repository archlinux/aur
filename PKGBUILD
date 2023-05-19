# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Mamba
pkgname="${_projectname,,}"
pkgver=2.5
pkgrel=1
pkgdesc='A virtual MIDI keyboard and file player/recorder for ALSA/JACK'
arch=(i686 x86_64 aarch64)
url="https://github.com/brummer10/$_projectname"
license=(BSD)
depends=(cairo)
makedepends=(alsa-lib fluidsynth graphite jack liblo libsigc++ libsmf xxd)
optdepends=('new-session-manager: for NSM support')
groups=(pro-audio)
source=("https://github.com/brummer10/Mamba/releases/download/v$pkgver/${_projectname}_$pkgver.tar.gz")
sha256sums=('4880c2fe2554843cce3dbf783adbaeae376e287daa86030c0fc5fc58f084b064')

build() {
  cd ${_projectname}_$pkgver
  make
}

package() {
  depends+=(libasound.so libfluidsynth.so libgraphite2.so=3 libjack.so liblo.so
            libsigc-2.0.so libsmf.so)
  cd ${_projectname}_$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
