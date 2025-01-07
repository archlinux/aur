# Maintainer: Sterophonick
pkgname=heartlib-git
_pkgname='heartlib'
pkgver=2a40da6
pkgrel=1
pkgdesc='Comprehensive API for Nintendo GBA inspired by HAMLib and HELlib. Requires devkitARM'
url='https://github.com/Sterophonick/HeartLib'
arch=(x86_64 i686 aarch64)
makedepends=(base-devel)
source=(git+https://github.com/Sterophonick/HeartLib)
md5sums=('SKIP')
license=('gplv3')
options=(!strip)

prepare() {
  if [ ! -d "/opt/devkitpro" ]; then
    echo "devkitPro not installed! HeartLib requires devkitPro to be installed on your system!"
    exit 1
  fi
}

package() {

  mkdir -p $pkgdir/opt/devkitpro/libheart/include
  mkdir -p $pkgdir/opt/devkitpro/libheart/lib
  mkdir -p $pkgdir/opt/devkitpro/examples

  cd HeartLib
  mkdir -p build
  make

  cp libheart.a $pkgdir/opt/devkitpro/libheart/lib
  cp LICENSE $pkgdir/opt/devkitpro/libheart
  cp APLIB-LICENSE $pkgdir/opt/devkitpro/libheart
  cp GBFS-LICENSE $pkgdir/opt/devkitpro/libheart
  cp LIBGBA-LICENSE $pkgdir/opt/devkitpro/libheart
  cp RUMBLE-LICENSE $pkgdir/opt/devkitpro/libheart
  cp include/* $pkgdir/opt/devkitpro/libheart/include

  cp -r samples $pkgdir/opt/devkitpro/examples/libheart-samples
}
