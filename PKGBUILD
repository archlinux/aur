# Maintainer: John Lane <archlinux at jelmail.com>

# Provides arm-bcm2708 compiler toolchains for soft- and hard-float
# cross compilers targeting the Raspberry Pi. To use with distcc
# set up its PATH to include either, for hard-float:
#
#     /usr/bin/arm-bcm2708hardfp-linux-gnueabi/
#
# or, for soft-float:
#
#     /usr/bin/arm-bcm2708-linux-gnueabi/
#
# Upstream supports i686 only

pkgname=arm-bcm2708-linux-gnueabi
pkgver=14.9c3d7b6
pkgrel=1
pkgdesc="GCC Cross Compiler Toolchain provided by RaspberryPi"
arch=('i686')
url="https://github.com/raspberrypi/tools/tree/master/arm-bcm2708"
license=('GPL')
makedepends=('git')
provides=('arm-bcm2708-linux-gnueabi')
source=('git://github.com/raspberrypi/tools.git')
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd tools
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {

  for tc_dir in ${srcdir}/tools/arm-bcm2708/arm-bcm2708*
  do

    tc=$(basename ${tc_dir})

    install -d ${pkgdir}/{opt,usr/bin/${tc}}
    cp -a ${tc_dir} ${pkgdir}/opt

    for i in $(find ${pkgdir}/opt -name "${tc}-*")
    do
      ln -s /opt/${tc}/bin/${i##*/} ${pkgdir}/usr/bin/${tc}/${i##*i-}
    done

  done
}
