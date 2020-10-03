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
makedepends=('git' 'meson' 'ninja' 'pkgconf')
optdepends=('pulseaudio')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/$_gitname/archive/$pkgver.tar.gz)
sha256sums=('afdbd0f069e857b62bbb30ca3ba34ee95a7b8334c02711a4c82829bf206dfd0d')

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
