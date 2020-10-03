# Maintainer: GhostNaN <GhostNaN@protonmail.com>
_gitname=recidia-audio-visualizer
pkgname="$_gitname"
pkgver=0.1
pkgrel=1
pkgdesc="A highly customizable real time audio visualizer"
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$_gitname"
license=('GPL3')
depends=('gsl' 'fftw' 'ncurses' 'libconfig' 'portaudio')
makedepends=('git' 'meson' 'ninja')
optdepends=('pulseaudio')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/$_gitname/archive/$pkgver.tar.gz)
sha256sums=('f1a6f8e2a2d56e9f57bb26e08987b50900664e5f0a221733416635359e51fae5')

build() {
  cd $pkgname-$pkgver
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  
  mkdir -p $pkgdir/etc/recidia/
  install -D settings.cfg $pkgdir/etc/recidia/
  
  DESTDIR="$pkgdir" ninja -C build install
  
  
}
