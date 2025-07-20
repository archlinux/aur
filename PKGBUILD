# Maintainer: Tauri Gregory <arch_aur --at-- tgregory dot net>
# Contributor: Original submitter: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=constellation
pkgver=3.1.0
_pkgver=3.1.0
pkgrel=1
pkgdesc="A graph-focused data visualisation and interactive analysis application"
arch=('x86_64')
url='https://constellation-app.com'
license=('Apache-2.0')
depends=('java-runtime'
         'libnet'
         'lib32-glibc'
         'gtk3'
         'gtk2')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/constellation-app/constellation/releases/download/v${_pkgver}/constellation-linux-v${_pkgver}.tar.gz"
        'icon.png')
sha256sums=('118da12bf9321cce76cbf9e557f3faec4d2ce65628dc0f509ec06ad25dc17d6e'
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
