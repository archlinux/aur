# Maintainer: lxhillwind <lxhillwind@gmail.com>

pkgname=pamixer-lxhillwind-patch
pkgver=1.3
pkgrel=4
pkgdesc='Pulseaudio command-line mixer like amixer, with ignoring output using --get-mute option.'
arch=(i686 x86_64)
url='https://github.com/cdemoulins/pamixer'
license=(GPL3)
depends=(libpulse boost-libs)
makedepends=(boost)
conflicts=(pamixer)
source=("pamixer-$pkgver.tar.gz::https://github.com/cdemoulins/pamixer/archive/$pkgver.tar.gz"
        'ignore_output_from_get_mute.patch')
sha1sums=('ceb4e609a9cf3521040d52313c194757f30526c1'
          '41e6ccc0385e48e342c99624b6e1a4a6d983b211')

build() {
  cd pamixer-$pkgver
  patch -Np0 -i $srcdir/ignore_output_from_get_mute.patch
  make
}

package() {
  cd pamixer-$pkgver
  install -D -m755 pamixer "$pkgdir"/usr/bin/pamixer
}
