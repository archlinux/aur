# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio-minimal
pkgver=27.0.1
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording. Compiled with minimal features."
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite')
makedepends=('cmake' 'libfdk-aac' 'x264' 'swig')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'sndio: Sndio input client'
            'v4l2loopback-dkms: virtual camera support')
source=(git://github.com/obsproject/obs-studio)
md5sums=('SKIP')

build() {
  cd obs-studio

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_SCRIPTING=OFF \
    -DSCRIPTING_ENABLED=OFF \
    -DDISABLE_LUA=ON \
    -DCOMPILE_LUA=OFF \
    -DCOMPILE_PYTHON=OFF \
    -DENABLE_PIPEWIRE=ON\
    -DENABLE_WAYLAND=ON \
    -DENABLE_UI=ON \
    -DDISABLE_PLUGINS=ON \
    -DDISABLE_PYTHON=ON \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"
}
