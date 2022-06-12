pkgname=xava-git
_pkgname=xava
pkgver=0.7.1.1.r0.g13e1346
pkgrel=1
pkgdesc='X11 Audio Visualizer for Alsa/Pulseaudio/FIFO'
arch=('any')
url='https://github.com/nikp123/xava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'wayland-protocols' 'libx11' 'sdl2' 'portaudio'
  'libpulse' 'sndio' 'mesa' 'pipewire' 'cairo' 'wayland' 'glew')
makedepends=('cmake' 'git' 'imagemagick')
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

