# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=relic-secrets-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="End-to-end encrypted secrets for developers and AI agents"
arch=('x86_64')
url="https://github.com/heycupola/relic"
license=('MIT')
depends=('bash' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'relic')
options=('!debug' '!strip')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/heycupola/relic/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/relic-linux-x64.tar.gz")
sha256sums=('c5a392b040aa7f06cfd78c6e19bb0a4fc2801d19585a46a036f9793bd908e53a')
sha256sums_x86_64=('1fc41d645ec558580ae9a7f409b7adb763525a4d5ee521343def8df37ac9e0ac')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -m755 relic -t "${pkgdir}/opt/${pkgname}"
  install -m644 librelic_runner.so libopentui.so -t "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  printf '#!/bin/sh
exec /opt/%s/relic "$@"
' "${pkgname}" > "${pkgdir}/usr/bin/relic"
  chmod 755 "${pkgdir}/usr/bin/relic"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
