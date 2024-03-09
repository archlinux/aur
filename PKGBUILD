# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Loewetiger <loewetiger at tuta dot io>

pkgname=obs-pipewire-audio-capture
pkgver=1.1.4
pkgrel=3
pkgdesc='PipeWire audio capturing for OBS Studio'
arch=('x86_64' 'x86_64_v3')
url='https://github.com/dimtpap/obs-pipewire-audio-capture'
license=('GPL-2.0-or-later')
depends=('obs-studio>=28' 'wireplumber')
optdepends=('pipewire-pulse: record PulseAudio applications'
            'pipewire-jack: record JACK applications'
            'pipewire-alsa: record ALSA applications')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=('2cfa22dea83c3de0935792fa1665153af858c84d1c6c14c3ffcb33c2ba2fc3f2a22def94c16ea17dca57f427a9cb71727eb4cea8f159a97b09d9f2229c568f62')

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
