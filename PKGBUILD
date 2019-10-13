# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps dot aur dot archlinux dot org>

_rtkver=0.7.1
pkgname=meters-lv2
pkgver=0.9.14
pkgrel=1
pkgdesc="Collection of LV2 plug-ins for audio-level metering from x42"
arch=('i686' 'x86_64')
url="http://x42-plugins.com/x42/x42-meters"
license=('GPL')
groups=('lv2-plugins')
depends=('fftw' 'jack' 'libglvnd' 'lv2' 'pango')
optdepends=('jack: standalone jack client'
            'liblo: standalone jack client')
# old names of this package
provides=('lv2-meters' 'meters.lv2')
conflicts=('lv2-meters' 'meters.lv2' 'x42-plugins')
source=("meters-lv2-$pkgver.tar.gz::https://github.com/x42/meters.lv2/archive/v$pkgver.tar.gz"
        "robtk-$_rtkver.tar.gz::https://github.com/x42/robtk/archive/v$_rtkver.tar.gz")
md5sums=('e7a2f56335476ad7945ca632841d9362'
         '77ff6fc180d32f19481323cf315a39a8')


build() {
  cd "${srcdir}/meters.lv2-$pkgver"

  export RW=../robtk-$_rtkver/
  make submodules
  make
}

package() {
  cd "${srcdir}/meters.lv2-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
