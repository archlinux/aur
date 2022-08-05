# Maintainer: Tauri Gregory <arch_aur --at-- tgregory dot net>
# Contributor: Original submitter: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=constellation
pkgver=1.6.0
_pkgver=1.6.0
pkgrel=1
pkgdesc="A graph-focused data visualisation and interactive analysis application"
arch=('x86_64')
url='https://constellation-app.com'
license=('Apache')
depends=('java-runtime'
         'libnet'
         'lib32-glibc'
         'gtk3'
         'gtk2')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/constellation-app/constellation-applications/releases/download/constellation-cyber-v${_pkgver}/constellation-cyber-linux-v${_pkgver}.tar.gz"
        'icon.png')
sha256sums=('1028e6961d0c8fcf7119396b0f4803c54a6407f5b2ac2dc980637931a9d9e50b'
            '4ddf0edb1323aa2e752a30fe17303e8ef25280e6d53dcdd147b9d7c811c05565')

package() {
  install -d "${pkgdir}/opt"
  cp -avR constellation "${pkgdir}/opt"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/constellation.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Constellation" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;Science;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  echo "#!/usr/bin/env bash
    cd /opt/constellation/bin
    ./constellation
    " > "${pkgname}.sh"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/constellation"
}
