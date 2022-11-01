# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=XTuner
pkgname=${_name,,}
pkgver=1.0
pkgrel=2
pkgdesc='An instrument tuner for JACK with NSM support'
arch=(aarch64 x86_64)
url='https://github.com/brummer10/XTuner'
license=(GPL2)
depends=(gcc-libs cairo)
makedepends=(fftw jack liblo libsigc++ zita-resampler)
optdepends=('new-session-manager: for NSM support')
groups=(pro-audio)
source=("https://github.com/brummer10/$_name/releases/download/v$pkgver/${_name}_$pkgver.tar.gz")
sha256sums=('9da772b5dab2e5e87be79c2558b29174fed6228cb28ae961b5f62b41a75f7185')

build() {
  cd ${_name}_$pkgver
  LDFLAGS="$LDFLAGS -z noexecstack" make
}

package() {
  depends+=(libfftw3f.so libjack.so liblo.so libsigc-2.0.so libzita-resampler.so)
  cd ${_name}_$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
