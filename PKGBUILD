# Maintainer: DetMittens
# Contributer: uth 2.0.0 update
#
# Supported Platforms	Features
# Haswell       (HSW)	vp8enc
# Bay Trail M   (BYT)	vp8enc
# Broadwell     (BRW)	vp9dec vp9enc
# Braswell      (BSW)	vp8enc vp9dec
#  
#
# The libva-intel-driver package isn't compiled with support for loading this driver
# so in order to use this driver's features with non hybrid codecs either
# recompile libva-intel-driver with the --enable-hybrid-codec or install
# the libva-intel-driver-hybrid package from the AUR

pkgname=intel-hybrid-codec-driver
_gitroot="git+https://github.com/01org/intel-hybrid-driver.git"
_gitname=intel-hybrid-driver
_pkgver=2.0.0
pkgver=$_pkgver.r169.edead0c
pkgrel=3
pkgdesc='Libva support for partially hardware accelerated encode and decode on Haswell and newer'
arch=('x86_64')
install=${pkgname}.install
url='https://01.org/linuxmedia/vaapi'
license=('MIT')
depends=('libva' 'libcmrt')
optdepends=('libva-intel-driver-hybrid: To be able to use the full hw codecs with hybrid codecs')
makedepends=('git')
source=("$_gitname::$_gitroot")
sha256sums=('SKIP')

pkgver() {
 cd ${srcdir}/$_gitname
 printf $_pkgver".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${_gitname}
  autoreconf -v --install
}

build() {
  cd ${srcdir}/${_gitname}
  ./configure --prefix=/usr \
    --disable-x11
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make install DESTDIR=${pkgdir}
}
