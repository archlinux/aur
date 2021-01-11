# Maintainer: GhostNaN <GhostNaN@protonmail.com>
_gitname=recidia-audio-visualizer
pkgname="$_gitname"
pkgver=0.2
pkgrel=1
pkgdesc="A highly customizable real time audio visualizer"
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$_gitname"
license=('GPL3')
depends=('gsl' 'glm' 'fftw' 'ncurses' 'libconfig' 'shaderc' 'vulkan-driver')
makedepends=('meson' 'ninja' 'vulkan-headers')
optdepends=('pulseaudio: Audio data collection - PICK ONE/BOTH'
            'portaudio: Audio data collection (Input Only) - PICK ONE/BOTH')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/$_gitname/archive/$pkgver.tar.gz)
sha256sums=('b1e7aa7a30737d22dfe8581c3032e366d8d3d61160b3ef74875ccb55487192eb')

build() {
  cd $pkgname-$pkgver
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  
  mkdir -p $pkgdir/etc/recidia/
  cp settings.cfg $pkgdir/etc/recidia/
  cp -r shaders/ $pkgdir/etc/recidia/
  
  DESTDIR="$pkgdir" ninja -C build install
}
