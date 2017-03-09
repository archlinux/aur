# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps dot aur dot archlinux dot org>

_rtkver=0.5.2
pkgname=meters-lv2
pkgver=0.9.3
pkgrel=1
pkgdesc="Collection of LV2 plug-ins for audio-level metering from x42"
arch=('i686' 'x86_64')
url="https://x42.github.io/meters.lv2"
license=('GPL')
groups=('lv2-plugins')
depends=('fftw' 'jack' 'lv2' 'pango')
# for building statically linked libfftw
makedepends=('gcc-fortran')
optdepends=('jack: standalone jack client'
            'liblo: standalone jack client')
# old names of this package
provides=('lv2-meters' 'meters.lv2')
conflicts=('lv2-meters' 'meters.lv2' 'x42-plugins')
source=("https://github.com/x42/meters.lv2/archive/v$pkgver.tar.gz"
        "https://github.com/x42/robtk/archive/v$_rtkver.tar.gz")
md5sums=('704bd18c340f1e84c994cbf0f5081604'
         'c9c79e2be3d83a83d245e779a28501e6')


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
