# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=stm32cubemonitor
# _pkgname=STM32CubeMonitor
_pkgname=STM32CubeMon
pkgver=1.4.0
pkgrel=1
pkgdesc="Graphical software for helping debug and diagnose STM32 applications while they are running by reading and displaying their variables in real-time"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemonitor.html"
license=('custom:SLA0048')
# package stlink provides stlink udev files
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'stlink')
options=('!strip')
_pkg_index_url="b1/14/a0/74/6d/ac/4d/4c"
# _pkg_file_name=${_pkgname}_lin_v${pkgver//./-}
# _pkg_file_name=${_pkgname}-Lin
_pkg_file_name=${_pkgname}-Lin_v${pkgver//./-}
source=("en.${_pkg_file_name}-${pkgver}.zip::https://www.st.com/content/ccc/resource/technical/software/sw_development_suite/group0/${_pkg_index_url}/${_pkg_file_name}/files/${_pkg_file_name}.zip/jcr:content/translations/en.${_pkg_file_name}.zip")
sha256sums=('3051deac09174cc5a906911c580e30c33f58d47707fdc536903ce27a42b5bc0f')

#    Extracted Files from ${_pkg_file_name}
#    ├── driver
#    │   └── st-stlink-udev-rules-1.0.2-3-linux-all.deb
#    ├── licenses
#    │   ├── Gnu Arm Embedded Toolchain EULA.txt
#    │   ├── LICENSES.chromium.html
#    │   ├── licenses_list_STM32CubeMonitor.txt
#    │   └── SLA0048 rev4.pdf
#    ├── snapshot_embedded_SW.zip
#    └── stm32cubemonitor_${pkgver}_amd64.deb

prepare() {
  install -dm755 build

  bsdtar -xf ${srcdir}/STM32CubeMonitor_lin/${pkgname}_${pkgver}_amd64.deb -C build
}

package() {
  tar -xf build/data.tar.xz -C ${pkgdir}
  
  install -dm755 ${pkgdir}/opt
  mv ${pkgdir}/usr/lib/${pkgname} ${pkgdir}/opt
  rm -rf ${pkgdir}/usr/lib
  rm -rf ${pkgdir}/usr/share/lintian

  # soft link
  ln -fs /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # license
  for _license in ${srcdir}/STM32CubeMonitor_lin/licenses/*
  do
    install -Dm644 "${_license}" -t ${pkgdir}/usr/share/licenses/${pkgname}/
  done 
}

# vim: set sw=2 ts=2 et:
