# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_rtkver=0.5.6
pkgname=tuna-lv2
pkgver=0.4.6
pkgrel=1
pkgdesc="A musical instrument strobe tuner as a stand-alone JACK client and LV2 plugin."
arch=('i686' 'x86_64')
url="http://x42-plugins.com/x42/x42-tuner"
license=('GPL')
groups=('lv2-plugins')
depends=('pango' 'fftw' 'jack' 'libglvnd' 'lv2')
makedepends=('mesa')
optdepends=('jack: standalone jack client'
            'liblo: standalone jack client')
# old names of this package
provides=('tuna.lv2' 'lv2-tuna')
conflicts=('tuna.lv2' 'lv2-tuna' 'x42-plugins')
source=("tuna-lv2-$pkgver.tar.gz::https://github.com/x42/tuna.lv2/archive/v${pkgver}.tar.gz"
        "robtk-$_rtkver.tar.gz::https://github.com/x42/robtk/archive/v${_rtkver}.tar.gz")
md5sums=('ac2983bed8e917e4ccda6561cb2c6acb'
         '89639d4249dc8bb1b79e0f84860633ce')

build() {
  cd "$srcdir/tuna.lv2-$pkgver"
  export RW=../robtk-$_rtkver/
  make
}

package() {
  cd "$srcdir/tuna.lv2-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
