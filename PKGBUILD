# Maintainer: Findlay Feng <findlayfeng@gmail.com>

_target_arch=(
  'aarch64-zephyr-elf'
  'arc64-zephyr-elf'
  'arc-zephyr-elf'
  'arm-zephyr-eabi'
  'microblazeel-zephyr-elf'
  'mips-zephyr-elf'
  'or1k-zephyr-elf'
  'riscv64-zephyr-elf'
  'rx-zephyr-elf'
  'sparc-zephyr-elf'
  'x86_64-zephyr-elf'
  'xtensa-amd_acp_6_0_adsp_zephyr-elf'
  'xtensa-amd_acp_7_0_adsp_zephyr-elf'
  'xtensa-amd_acp_7_3_adsp_zephyr-elf'
  'xtensa-dc233c_zephyr-elf'
  'xtensa-espressif_esp32_zephyr-elf'
  'xtensa-espressif_esp32s2_zephyr-elf'
  'xtensa-espressif_esp32s3_zephyr-elf'
  'xtensa-intel_ace15_mtpm_zephyr-elf'
  'xtensa-intel_ace30_ptl_zephyr-elf'
  'xtensa-intel_ace40_zephyr-elf'
  'xtensa-intel_tgl_adsp_zephyr-elf'
  'xtensa-mtk_mt8195_adsp_zephyr-elf'
  'xtensa-mtk_mt818x_adsp_zephyr-elf'
  'xtensa-mtk_mt8196_adsp_zephyr-elf'
  'xtensa-mtk_mt8365_adsp_zephyr-elf'
  'xtensa-nxp_imx_adsp_zephyr-elf'
  'xtensa-nxp_imx8m_adsp_zephyr-elf'
  'xtensa-nxp_imx8ulp_adsp_zephyr-elf'
  'xtensa-nxp_rt500_adsp_zephyr-elf'
  'xtensa-nxp_rt600_adsp_zephyr-elf'
  'xtensa-nxp_rt700_hifi1_zephyr-elf'
  'xtensa-nxp_rt700_hifi4_zephyr-elf'
  'xtensa-sample_controller_zephyr-elf'
  'xtensa-sample_controller32_zephyr-elf'
)
pkgname=("zephyr-sdk-gnu-bin")
pkgver=1.0.1
pkgrel=1
pkgdesc="SDK for Zephyr real-time operating system"
arch=('x86_64' 'aarch64')
url="https://www.zephyrproject.org/"
license=('Apache')
depends+=('cmake' 'gperf' 'dfu-util' 'dtc' 'tk' 'xz'
  "zephyr-sdk-cmake-modules=${pkgver}" "zephyr-sdk-profile=${pkgver}" "zephyr-sdk-hosttools-bin=${pkgver}"
)
provides=("zephyr-sdk-gnu")
optdepends=('ninja' 'make' 'ccache' 'python-pyelftools'
          'pyocd: programming and debugging ARM MCUs'
          'python-west: Zephyr RTOS Project meta-tool')

for _target in ${_target_arch[@]};do
  depends+=("zephyr-sdk-gnu-toolchain-${_target}-bin=${pkgver}")
done

options=(!strip)

build() {
  cd "$srcdir"
}

package() {
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
