# U-Boot tools rc channel
# Maintainer: Greyson Christoforo

buildarch=8

pkgname=uboot-tools-rc
pkgver=2020.07rc5
pkgrel=1
pkgdesc="U-Boot tools RCs"
arch=('x86_64')
url='http://www.denx.de/wiki/U-Boot/WebHome'
license=('GPL')
makedepends=('bc' 'dtc' 'git')
provides=('uboot-tools')
conflicts=('uboot-tools')
options=(!strip)
source=("ftp://ftp.denx.de/pub/u-boot/u-boot-${pkgver/rc/-rc}.tar.bz2")
md5sums=('3b10951fa62e91433d0045a29a8588b0')

prepare() {
  cd u-boot-${pkgver/rc/-rc}

}

build() {
  cd u-boot-${pkgver/rc/-rc}
  make defconfig
  make tools-all
}

package() {
  cd u-boot-${pkgver/rc/-rc}
  install -m 755 -d "$pkgdir"/usr/bin
  install -m 755 -t "$pkgdir"/usr/bin/ tools/{mk{,env}image,env/fw_printenv,img2srec,dumpimage,netconsole,jtagconsole,ncb}
  ln -s fw_printenv "$pkgdir"/usr/bin/fw_setenv
  install -m 644 -D doc/mkimage.1 "$pkgdir"/usr/share/man/man1/mkimage.1
}

