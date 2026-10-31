# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Loewetiger <loewetiger at tuta dot io>

pkgname=obs-pipewire-audio-capture
pkgver=1.2.2
pkgrel=1
pkgdesc='PipeWire audio capturing for OBS Studio'
arch=('x86_64' 'x86_64_v3')
url='https://github.com/dimtpap/obs-pipewire-audio-capture'
license=('GPL-2.0-or-later')
depends=('obs-studio>=28' 'wireplumber')
optdepends=('pipewire-pulse: record PulseAudio applications'
            'pipewire-jack: record JACK applications'
            'pipewire-alsa: record ALSA applications')
makedepends=('cmake' 'simde')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=('92a3ac37e14cc264420349d7da5f6ba5fe891baee588e5bb96dfd737e0847a7196ddbd96a65dfd840f6efd2e3de0db51f9cc4b5255e6447ab282d9bb1e7dc593')

build() {
  cd $pkgname-$pkgver
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cd build
  make
}

package() {
  cd $pkgname-$pkgver/build
  make install
}
