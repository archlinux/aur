# Maintainer: taotieren <admin@taotieren.com>

pkgbase=at32-ide-project-generate-bin
pkgname=at32-ide-project-generate
pkgver=1.0.06
pkgrel=1
# epoch=1
pkgdesc="AT32 IDE 是个跨平台 ARM 嵌入式系统的软件开发环境。 它包含一系列的 Eclipse 插件和工具。该插件可让用户在 AT32 IDE 开发环境下创建、建置和调试 AT32
MCU。"
arch=('x86_64')
url="https://www.arterytek.com/cn/support/index.jsp"
license=('LicenseRef-scancode-commercial-license')
provides=(at32-ide-project-generate)
conflicts=()
replaces=()
depends=(bash
  gcc-libs
  glibc)
makedepends=(libarchive sed)
optdepends=('artery-isp-console-bin: Artery ISP Console 是一款基于 MCU Bootloader 的命令行应用程序。使用该应用程序,用户可以通过 UART 端口或者 USB 端口配置操作 Artery 的 MCU 设备。'
  'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
  'at32-ide'
  'at32-work-bench')
backup=()
options=()
# install=${pkgname}.install
_pkg_name=AT32IDE_Project_Generate
_pkg_linux=${_pkg_name}_Linux-${arch}
_pkg_file_name=${_pkg_linux}_V${pkgver}
source=("${_pkg_file_name}.zip::https://www.arterytek.com/download/TOOL/${_pkg_file_name}.zip")
sha256sums=('62d467329563818c97e6de1aa9ae20f25b68d2e3b57461546e477bf0c9d39e58')
noextract=(${_pkg_file_name}.zip)

package() {
  install -dm0755 "${pkgdir}/opt/artery32/${pkgname}/"

  bsdtar -xf ${srcdir}/${_pkg_file_name}.zip -C "${pkgdir}/opt/artery32/${pkgname}/"

  install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash
/opt/artery32/${pkgname}/${_pkg_linux}/${_pkg_name} "\$@"
EOF
  chown -R root:root "${pkgdir}/"
}
