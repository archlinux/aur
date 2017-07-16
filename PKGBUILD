# Maintainer: DetMittens
#
# Supported Platforms	Features
# Haswell 	(HSW)	vp8enc
# Bay Trail M 	(BYT)	vp8enc
# Broadwell 	(BRW)	vp9dec vp9enc
# Braswell 	(BSW)	vp8enc vp9dec
#
# The libva-intel-driver package isn't compiled with support for loading this driver
# so in order to use this driver's features with non hybrid codecs either
# recompile libva-intel-driver with the --enable-hybrid-codec or install
# the libva-intel-driver-hybrid package from the AUR

pkgname=intel-hybrid-codec-driver
_gitname=intel-hybrid-driver
pkgver=1.0.2
pkgrel=1
pkgdesc='Libva support for VP9 decode and VP8 encode on Skylake and Braswell'
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
depends=('libva' 'libcmrt')
optdepends=('libva-intel-driver-hybrid: To be able to use the full hw codecs with hybrid codecs')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/01org/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('16cd66872e8043ce6c0e9a016a043c460e8a180fdc520f31c1f97ffef7828d7b')

prepare() {
  cd ${srcdir}/${_gitname}-${pkgver}
  autoreconf -v --install
}

build() {
  cd ${srcdir}/${_gitname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}-${pkgver}
  make install DESTDIR=${pkgdir}
}
