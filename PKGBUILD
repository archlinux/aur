# Maintainer: GhostNaN <GhostNaN@protonmail.com>
_gitname=recidia-audio-visualizer
pkgname="$_gitname"
pkgver=0.1.1
pkgrel=1
pkgdesc="A highly customizable real time audio visualizer"
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$_gitname"
license=('GPL3')
depends=('gsl' 'fftw' 'ncurses' 'libconfig')
makedepends=('meson' 'ninja')
optdepends=('pulseaudio: Audio data collection - PICK ONE/BOTH'
            'portaudio: Audio data collection (Input Only) - PICK ONE/BOTH')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/GhostNaN/$_gitname/archive/$pkgver.tar.gz)
sha256sums=('edb796a51a3ba7080e2e455cd571fa4d7ac6e32316d980bb6ee688c5e1b3ec6e')

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
