# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=subconverter-bin
pkgver=0.7.2
pkgrel=1
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
sha256sums_x86_64=('06bbe9e50291a0f83a1618697f704a5c002ef5bba60627344b5cd0651c3dc3b3')
sha256sums_armv7h=('a8fdef6b55f2f9460e2eb4ea977d5287f6d07cb98c9e49b35fd572f248136e5d')
sha256sums_aarch64=('d1059e22187b0a7e2bf069d8a1b8c097c54750646530893ee0c5e096203798c1')

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
