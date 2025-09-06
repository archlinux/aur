# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Loewetiger <loewetiger at tuta dot io>

pkgname=obs-pipewire-audio-capture
pkgver=1.2.1
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
b2sums=('6b53cca6c2f91bd3c3383e84683c3de3728ff703dc9287a823c3e03245742785a97d64eaf7e74e3fd6a57f844f43664f6101d304548cbce95b91c725fb0a38b7')

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
