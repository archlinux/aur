pkgname=xava-git
_pkgname=xava
pkgver=0.7.0.0.r0.gdc62314
pkgrel=1
pkgdesc='X11 Audio Visualizer for Alsa/Pulseaudio/FIFO'
arch=('any')
url='https://github.com/nikp123/xava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'wayland-protocols' 'libx11' 'sdl2' 'portaudio'
  'libpulse' 'sndio' 'mesa' 'pipewire')
makedepends=('cmake' 'git')
source=('git+https://github.com/nikp123/xava')
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build
  cmake -DXAVA_LINK_TO_INSTALL_DIR=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir"/usr ..
  make
}

package() {
  cd $_pkgname

  # Install binaries
  cd build
    make install
  cd ..
}

