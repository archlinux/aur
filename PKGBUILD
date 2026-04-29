# Maintainer: Findlay Feng <findlayfeng@gmail.com>

pkgname="zephyr-sdk-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64' 'aarch64')
url="https://www.zephyrproject.org/"
license=('Apache')

provides=('zephyr-sdk')
conflicts=('zephyr-sdk')
depends+=('cmake' 'gperf' 'dfu-util' 'dtc' 'tk' 'xz'
  "zephyr-sdk-gnu-bin=${pkgver}"
  "zephyr-sdk-llvm-bin=${pkgver}"
)
optdepends=('ninja' 'make' 'ccache' 'python-pyelftools'
          'pyocd: programming and debugging ARM MCUs'
          'python-west: Zephyr RTOS Project meta-tool')

options=(!strip)

_installdir=opt/zephyr-sdk

build() {
  cd "$srcdir"
}

package () {
  cd "$srcdir"
}

# Manual test procedure: get Zephyr Kernel, build an example, and run in Qemu:
#
# $ wget https://github.com/zephyrproject-rtos/zephyr/archive/master.tar.gz
# $ tar xf master.tar.gz
# $ cd zephyr-master
# $ source zephyr-env.sh
# $ cd samples/hello_world
# $ mkdir build && cd build
# $ cmake -GNinja -DBOARD=qemu_cortex_a53 ..
# $ ninja run

# Alternative using West:
#
# $ west init testws
# $ cd testws
# $ west update
# $ cd zephyr
# $ west build --pristine=always -b qemu_cortex_a53 samples/hello_world
# $ cd build
# $ ninja run

# Expected output for -b qemu_cortex_m3:
#
#       *** Booting Zephyr OS version 2.4.99  ***
#       Hello World! qemu_cortex_a53

# More info: https://docs.zephyrproject.org/latest/getting_started/index.html
