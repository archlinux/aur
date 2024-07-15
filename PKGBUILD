# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Loewetiger <loewetiger at tuta dot io>

pkgname=obs-pipewire-audio-capture
pkgver=1.1.5
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
b2sums=('4f65b5a73cb2b23d44f281fd38f50defa3bee3791d0ac2cab67a76de0c16c162c9ea41b647d13dee4d5378b712640fd2e0233b503a8da74bf9c736faa97f10f9')

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
