# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_rtkver=0.5.2
pkgname=tuna-lv2
pkgver=0.4.2
pkgrel=1
pkgdesc="A musical instrument strobe tuner as a stand-alone JACK client and LV2 plugin."
arch=('i686' 'x86_64')
url="https://github.com/x42/tuna.lv2"
license=('GPL')
groups=('lv2-plugins')
depends=('pango' 'fftw' 'jack' 'lv2')
makedepends=('mesa')
optdepends=('jack: standalone jack client'
            'liblo: standalone jack client')
# old names of this package
provides=('tuna.lv2' 'lv2-tuna')
conflicts=('tuna.lv2' 'lv2-tuna' 'x42-plugins')
source=("$url/archive/v${pkgver}.tar.gz"
        "https://github.com/x42/robtk/archive/v${_rtkver}.tar.gz")
md5sums=('3fd6696aa13d90c1143458b38b1ced37'
         'c9c79e2be3d83a83d245e779a28501e6')

build() {
  cd "$srcdir/tuna.lv2-$pkgver"
  export RW=../robtk-$_rtkver/
  make
}

package() {
  cd "$srcdir/tuna.lv2-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
