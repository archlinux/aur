# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Mamba
pkgname="${_projectname,,}"
pkgver=2.6
pkgrel=1
pkgdesc='A virtual MIDI keyboard and file player/recorder for ALSA/JACK'
arch=(x86_64 aarch64)
url="https://github.com/brummer10/$_projectname"
license=(0BSD MIT)
depends=(gcc-libs glibc cairo libx11)
makedepends=(alsa-lib fluidsynth graphite jack liblo libsigc++ libsmf xxd)
optdepends=('new-session-manager: for NSM support')
groups=(pro-audio)
source=("https://github.com/brummer10/Mamba/releases/download/v$pkgver/${_projectname}_$pkgver.tar.gz")
sha256sums=('c5439d40184dd5e5967fd9d49b185e8f034bce41a080af3021a2e4146c29466a')

build() {
  cd ${_projectname}_$pkgver
  make
}

package() {
  depends+=(libasound.so libfluidsynth.so libjack.so liblo.so libsigc-2.0.so
            libsmf.so)
  cd ${_projectname}_$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
