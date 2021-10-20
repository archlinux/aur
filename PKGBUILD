# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=subconverter-bin
pkgver=0.7.1
pkgrel=4
pkgdesc='Utility to convert between various proxy subscription formats'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/tindy2013/subconverter"
license=('GPL3')
provides=('subconverter')
depends=('bash')
source=(subconverter.service)
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/subconverter_linux64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/subconverter_armv7.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/subconverter_aarch64.tar.gz")
sha256sums=('dddffe61ec8cb6160393c1ac422ec592e534da3c0ac88cc74ae668732fbc3e6e')
sha256sums_x86_64=('978a6c0e5d3a0c77b1269567a68c4f37cf413f95c40140b7943f6ffcb52255b4')
sha256sums_armv7h=('46c65f5dea859e03febcd91f59367af5257f6b07113fdcee8f49aaea5e22d11a')
sha256sums_aarch64=('032c7a87be0efd1ce7f63fb075569121f4db45f30fd09f8e281d30bbaccefd7e')

prepare() {
  cd "${srcdir}/subconverter"
  echo "#!/usr/bin/env bash
  /opt/subconverter/subconverter" > subconverter.sh
  chmod 755 subconverter.sh
}

package() {
  mkdir -p "${pkgdir}/opt/subconverter"
  cp -aR "${srcdir}"/subconverter/* "${pkgdir}/opt/subconverter"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/subconverter/subconverter.sh "${pkgdir}/usr/bin/subconverter"
  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 "${srcdir}"/subconverter.service  ${pkgdir}/usr/lib/systemd/system/subconverter.service
}
# vim:set ts=2 sw=2 et:
