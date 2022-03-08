# Maintainer: GhostNaN <GhostNaN@protonmail.com>
_gitname=recidia-audio-visualizer
pkgname="$_gitname"
pkgver=0.4
pkgrel=1
pkgdesc="A highly customizable real time audio visualizer"
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$_gitname"
license=('GPL3')
depends=('gsl' 'glm' 'fftw' 'ncurses' 'libconfig' 'shaderc' 'qt5-base' 'vulkan-driver')
makedepends=('meson' 'ninja' 'vulkan-headers')
optdepends=('pulseaudio: Audio data collection - PICK ONE/BOTH'
            'portaudio: Audio data collection (Input Only) - PICK ONE/BOTH')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/$_gitname/archive/$pkgver.tar.gz)
sha256sums=('7d08552f229e53cca8912f43dae846f47fb2d28b65dd71808a7b247549ff8937')

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
