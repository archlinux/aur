# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=birda-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="Bird species detection from audio with BirdNET and Perch models"
arch=('x86_64')
url="https://github.com/tphakala/birda"
license=('MIT')
depends=('bash' 'glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug' '!strip')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/birda-linux-x64-v${pkgver}.tar.gz")
sha256sums_x86_64=('ac154cd56a427c1ded8b2fcc4b25d556648f27d3e1e7607b49d64b802cd5b0dd')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -m755 birda -t "${pkgdir}/opt/${pkgname}"
  install -m644 libonnxruntime.so -t "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  printf '#!/bin/sh
exec /opt/%s/birda "$@"
' "${pkgname}" > "${pkgdir}/usr/bin/birda"
  chmod 755 "${pkgdir}/usr/bin/birda"
  install -Dm644 LICENSE THIRD_PARTY_LICENSES.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
