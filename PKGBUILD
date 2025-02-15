# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Loewetiger <loewetiger at tuta dot io>

pkgname=obs-pipewire-audio-capture
pkgver=1.2.0
pkgrel=1
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
b2sums=('14f4cf7ddef97a599026891cce0a0ddb3ba59e0b151c40413b4cb0904bb3d89285a45071b4058fd4897796dfe05d814024bff16c620ef2f9632601a3ee3ecea6')

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
