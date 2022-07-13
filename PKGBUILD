# Maintainer: Wallun <wallun AT disroot DOT org>
pkgname=karma-dashboard-bin
_pkgname=karma
pkgver=0.105
pkgrel=1
pkgdesc="Alert dashboard for Prometheus Alertmanager (binary, not built from source)"
arch=(x86_64)
url="https://github.com/prymitive/karma"
license=('Apache')
provides=(karma)
conflicts=("karma-dashboard")
backup=(etc/karma/karma.yml)
source=(karma.service
        karma.yml
        karma.sysusers
        "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
sha512sums=('b71a5c1f5ecc5a82dc612bc4a9a84810e8a185b33036c00bb8af822a557d86297c1c600bd2dcf6e2c3deb137fa66c58136f221f7d5d0369f286ff3dbc150a4af'
            '0416eb6d18bf3c44deb0946d8b6b73edcd49ea5b1999d69d8ae32986691d5851ae8935a97e5fd3d31f84386c4d665879e56f24234347d4b6589a1bcd79659e76'
            '008b496aad7b92fe1f884cd89a55b15eb320dfff5ce277eea0c05777f3e5c3044310c16bb6f40153f8e9ed2d1af633fbd0cfff46bb04a96e2df35dba17815d95'
            'e36008defc4e2a75c55d34448254e0614c9d7ec050c2d300e0b6e406dc08f6cdb22eb9421867ec572cf0a7e71d5dff49825e59e14e8830d8b3b3ee793c9c8102')
package() {
  # Install binary
  install -D -m0775 "${srcdir}/${_pkgname}-linux-amd64" \
    "${pkgdir}/usr/bin/${_pkgname}"

  # Install example configuration
  install -D -m0644 "${srcdir}/${_pkgname}.yml" \
    "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"

  # Install systemd service file
  install -D -m0644 "${srcdir}/${_pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  # Install sysusers
  install -D -m0644 "${srcdir}/${_pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
