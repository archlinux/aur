# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_rtkver=0.5.3
pkgname=tuna-lv2
pkgver=0.4.3
pkgrel=1
pkgdesc="A musical instrument strobe tuner as a stand-alone JACK client and LV2 plugin."
arch=('i686' 'x86_64')
url="http://x42-plugins.com/x42/x42-tuner"
license=('GPL')
groups=('lv2-plugins')
depends=('pango' 'fftw' 'jack' 'lv2')
makedepends=('mesa')
optdepends=('jack: standalone jack client'
            'liblo: standalone jack client')
# old names of this package
provides=('tuna.lv2' 'lv2-tuna')
conflicts=('tuna.lv2' 'lv2-tuna' 'x42-plugins')
source=("https://github.com/x42/tuna.lv2/archive/v${pkgver}.tar.gz"
        "https://github.com/x42/robtk/archive/v${_rtkver}.tar.gz")
md5sums=('555c287130e298a9e773e12a9329bb59'
         'cf03f8276146cf8950578350158381c6')

build() {
  cd "$srcdir/tuna.lv2-$pkgver"
  export RW=../robtk-$_rtkver/
  make
}

package() {
  cd "$srcdir/tuna.lv2-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
