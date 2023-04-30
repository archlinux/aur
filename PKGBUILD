# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=2.10.1
pkgrel=1
pkgdesc='A modern reverse proxy'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/containous/traefik'
license=('MIT')
install="${_pkgname}.install"
backup=(
  'etc/traefik/traefik.toml'
  'etc/logrotate.d/traefik'
)
source=(
  'traefik.logrotate'
  'traefik.service'
  'traefik.toml'
  "https://raw.githubusercontent.com/containous/${_pkgname}/v${pkgver}/LICENSE.md"
)
source_i686=("${_pkgname}_i686_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_386.tar.gz")
source_x86_64=("${_pkgname}_x86_64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}_armv6h_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${_pkgname}_armv7h_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${_pkgname}_aarch64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('da59d047177cae773d248684e8484d91c71201f5bc07fe72452efdf9bed1a7f4'
            '95a06c5379332d05f6f783019ab0276ed1a2ec2fcf5e87a5933e08e9e0dcca62'
            'abfcfe24e742bf8968749ea79e2c0425bef3d37d16eb60311b5a994312a1e54d'
            'bff185bf46b54f7723a6931e2acd4e62b0e2acdc22228159a79d0e5f4ab7226f')
sha256sums_i686=('3514dd0f6388744d6b83304ca5d699933a4aacaae16d3fb35da22c56b9f527a7')
sha256sums_x86_64=('8d9bce0e6a5bf40b5399dbb1d5e3e5c57b9f9f04dd56a2dd57cb0713130bc824')
sha256sums_armv6h=('75e1132361450e83fc4a9863220161092e8ea477d28a7c3fafe8f0e9d81923b6')
sha256sums_armv7h=('dcbd195e075e7cce0ce4520d7bf82641b5c8e9feef348e70539959d6e4116c61')
sha256sums_aarch64=('260a574105e44901f8c9c562055936d81fbd9c96a21daaa575502dc69bfe390a')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
