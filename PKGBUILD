pkgname=xava-git
_pkgname=xava
pkgver=0.7.1.1.r0.gd0ccf97
pkgrel=1
pkgdesc='X11 Audio Visualizer for Alsa/Pulseaudio/FIFO'
arch=('any')
url='https://github.com/nikp123/xava'
license=('MIT')
depends=(
	# Base filter
	'fftw'

	# Input methods
	'alsa-lib'
	'portaudio'
        'libpulse'
	'sndio' 
        'pipewire'

	# Output libraries
	'wayland' 'wayland-protocols'
	'libx11' 'libxrandr'
	'sdl2'

	# Graphics API support
        'mesa' 'glew' 'cairo'

	# Misc
	'curl' 'dbus' 'taglib' 'zlib'
)
makedepends=(
	# To build and fetch dependencies
	'cmake' 
	'git'
	# To build the Linux icon
	'imagemagick' 
	'librsvg'
)
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

