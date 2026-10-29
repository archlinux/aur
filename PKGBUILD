# Maintainer: Micraow <micraow@users.noreply.github.com>
pkgname=wpsdav-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Mount WPS/Kdocs cloud storage as a WebDAV endpoint"
arch=('x86_64')
url="https://github.com/Micraow/WPS-DAV"
license=('MIT')
provides=('wpsdav')
conflicts=('wpsdav' 'wpsdav-git')
options=('!strip' '!debug')
source=("wpsdav-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/wpsdav_${pkgver}_linux_amd64.tar.gz")
# Replace SKIP with the checksum published in the release's
# checksums-sha256.txt before submitting/updating the AUR package.
sha256sums=('d982141431b79d409d22a1442f6024a7a3382f1b9a52b45941c6477341019184')

package() {
  install -Dm755 "${srcdir}/wpsdav" "${pkgdir}/usr/bin/wpsdav"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/config.example.json" "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
  # systemd --user unit (present in release archives from 0.1.1 on)
  if [ -f "${srcdir}/wpsdav.service" ]; then
    install -Dm644 "${srcdir}/wpsdav.service" "${pkgdir}/usr/lib/systemd/user/wpsdav.service"
  fi
}
