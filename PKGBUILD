# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps dot aur dot archlinux dot org>

_rtkver=0.5.3
pkgname=meters-lv2
pkgver=0.9.4
pkgrel=1
pkgdesc="Collection of LV2 plug-ins for audio-level metering from x42"
arch=('i686' 'x86_64')
url="http://x42-plugins.com/x42/x42-meters"
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
md5sums=('6d6f3986f9c2717ccffa5226cc3b71a8'
         'cf03f8276146cf8950578350158381c6')


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
