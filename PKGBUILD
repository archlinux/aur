# Maintainer: vociferous <vociferous@fail.pm>
pkgname=gokapi
pkgver=1.8.1
pkgrel=4
pkgdesc="Gokapi is a lightweight server to share files"
arch=('x86_64')
url="https://github.com/Forceu/Gokapi"
license=('AGPL-3.0')
backup=('etc/gokapi/config.json')

source=(
  ${url}/releases/download/v${pkgver}/${pkgname}-linux_amd64.zip
  gokapi.tmpfiles
  gokapi.sysusers
  gokapi.service
)
sha256sums=('491d312ff77d44735832f7a7f7d5a632836f08445de5630de1e819ab8d7ba4cb'
            '65f75fb94b313597fd3d87afd8c1de222c22c4653e6e1c475735d2d685ecd2f5'
            'be6bf84b09c83058a300f58d7d520058b5c971828cda3b5335a478f94c083516'
            '99481ddaf7442794ed5ec3447065316988a36f0d2e6311cc7664181782f0a6ef')
package() {
  # Install the executables
  install -d "$pkgdir"/usr/bin/
  install -m 755 gokapi-linux_amd64 "$pkgdir"/usr/bin/gokapi

  install -d "$pkgdir"/etc/gokapi/
  
  # Systemd service setup
  install -Dm 644 "${srcdir}/gokapi.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/gokapi.sysusers" "${pkgdir}/usr/lib/sysusers.d/gokapi.conf"
  install -Dm 644 "${srcdir}/gokapi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/gokapi.conf"
}

#/etc/gokapi
#/var/lib/gokapi
