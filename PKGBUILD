# Maintainer: Jesse R Codling <jclds139@gmail.com>
# Contributor: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>

pkgbase=uboot-sunxi
pkgname=('uboot-a10-olinuxino-lime'
         'uboot-a10s-olinuxino-micro'
         'uboot-a13-olinuxino'
         'uboot-a13-olinuxino-micro'
         'uboot-a20-olinuxino-lime'
         'uboot-a20-olinuxino-lime2'
         'uboot-a20-olinuxino-micro'
         'uboot-bananapi'
         'uboot-cubieboard'
         'uboot-cubieboard2'
         'uboot-cubietruck'
         'uboot-pcduino'
         'uboot-pcduino3'
         'uboot-pcduino3-nano')
pkgver=2022.10
pkgrel=1
arch=('any')
url="https://github.com/u-boot/u-boot"
options=(!distcc)
license=('GPL')
makedepends=('arm-none-eabi-gcc' 'bc' 'dtc' 'python' 'swig')
backup=(boot/boot.txt boot/boot.scr)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'boot.txt'
        'mkscr')
md5sums=('bea02112ee09eb362f35c296d8968daa'
         '95f60c0ae1315e986d8a2aee15d5f854'
         '021623a04afd29ac3f368977140cfbfd')
sha256sums=('49abc4dd4daff017b8abd6ee33b63d4892de878602ba5474347167c7d721e1b6'
            '24ca87bc2941bc5c6230e9004c0305fa63c5c007160bd438d296691bd979f27a'
            'a4fc8b6b92bc364d6542670d294aa618a8501fb8729f415cc0a3eed776ef0c8e')


boards=('A10-OLinuXino-Lime'
        'A10s-OLinuXino-M'
        'A13-OLinuXino'
        'A13-OLinuXinoM'
        'A20-OLinuXino-Lime'
        'A20-OLinuXino-Lime2'
        'A20-OLinuXino_MICRO'
        'Bananapi'
        'Cubieboard'
        'Cubieboard2'
        'Cubietruck'
        'Linksprite_pcDuino'
        'Linksprite_pcDuino3'
        'Linksprite_pcDuino3_Nano')

build() {
  cd u-boot-${pkgver}

  unset CFLAGS CXXFLAGS LDFLAGS LTOFLAGS
  export CROSS_COMPILE=arm-none-eabi-

  for i in ${boards[@]}; do
    mkdir ../bin_${i}
    make mrproper
    make ${i}_defconfig
    make -j`nproc`
    mv u-boot-sunxi-with-spl.bin ../bin_${i}
  done

  tools/mkimage -A arm -O linux -T script -C none -d ../boot.txt ../boot.scr
}

package_uboot-a10-olinuxino-lime() {
  arch=('armv7h')
  pkgdesc="U-Boot for A10 OLinuXino Lime"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_A10-OLinuXino-Lime/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-a10s-olinuxino-micro() {
  arch=('armv7h')
  pkgdesc="U-Boot for A10s OLinuXino Micro"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_A10s-OLinuXino-M/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-a13-olinuxino() {
  arch=('armv7h')
  pkgdesc="U-Boot for A13 OLinuXino"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_A13-OLinuXino/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-a13-olinuxino-micro() {
  arch=('armv7h')
  pkgdesc="U-Boot for A13 OLinuXino Micro"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_A13-OLinuXinoM/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-a20-olinuxino-lime() {
  arch=('armv7h')
  pkgdesc="U-Boot for A20 OLinuXino Lime"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_A20-OLinuXino-Lime/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-a20-olinuxino-lime2() {
  arch=('armv7h')
  pkgdesc="U-Boot for A20 OLinuXino Lime2"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_A20-OLinuXino-Lime2/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-a20-olinuxino-micro() {
  arch=('armv7h')
  pkgdesc="U-Boot for A20 OLinuXino Micro"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_A20-OLinuXino_MICRO/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-bananapi() {
  arch=('armv7h')
  pkgdesc="U-Boot for BananaPi"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_Bananapi/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot/u-boot-sunxi-with-spl.bin

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-cubieboard() {
  arch=('armv7h')
  pkgdesc="U-Boot for Cubieboard"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_Cubieboard/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot/u-boot-sunxi-with-spl.bin

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-cubieboard2() {
  arch=('armv7h')
  pkgdesc="U-Boot for Cubieboard 2"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_Cubieboard2/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot/u-boot-sunxi-with-spl.bin

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-cubietruck() {
  arch=('armv7h')
  pkgdesc="U-Boot for Cubietruck"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_Cubietruck/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot/u-boot-sunxi-with-spl.bin

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-pcduino() {
  arch=('armv7h')
  pkgdesc="U-Boot for pcDuino"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_Linksprite_pcDuino/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-pcduino3() {
  arch=('armv7h')
  pkgdesc="U-Boot for pcDuino3"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_Linksprite_pcDuino3/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}

package_uboot-pcduino3-nano() {
  arch=('armv7h')
  pkgdesc="U-Boot for pcDuino3 Nano"
  install=${pkgbase}.install
  provides=('uboot-sunxi')
  conflicts=('uboot-sunxi')

  install -d "${pkgdir}"/boot
  install -Dm644 bin_Linksprite_pcDuino3_Nano/u-boot-sunxi-with-spl.bin "${pkgdir}"/boot

  install -Dm644 boot.txt "${pkgdir}"/boot/boot.txt
  install -Dm644 boot.scr "${pkgdir}"/boot/boot.scr
  install -Dm755 mkscr "${pkgdir}"/boot/mkscr
}
