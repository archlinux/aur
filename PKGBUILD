# Maintainer: Mikele <mikele@gmail.com>

pkgname=radiotop-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Linux desktop internet-radio browser and player"
arch=('x86_64')
url="https://github.com/mikelexp/RadioTop"
license=('GPL-3.0-or-later')
depends=('gtk3')
source=("${url}/releases/download/v${pkgver}/radiotop-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('e643aa8103509d9864347aa79310b7baf1bec18c454ee690d0fee3fc87f0fec9')

package() {
  install -d "${pkgdir}/usr/lib/radiotop"
  cp -a "${srcdir}/bundle/." "${pkgdir}/usr/lib/radiotop/"
  install -d "${pkgdir}/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /usr/lib/radiotop/radiotop "$@"' > "${pkgdir}/usr/bin/radiotop"
  chmod 755 "${pkgdir}/usr/bin/radiotop"
  install -Dm644 "${srcdir}/radiotop.desktop" \
    "${pkgdir}/usr/share/applications/radiotop.desktop"
  install -Dm644 "${srcdir}/radiotop.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radiotop.png"
  install -Dm644 "${srcdir}/radiotop.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/radiotop.svg"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
