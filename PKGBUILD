# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=2.7.1
pkgrel=2
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
            '18540838ea72e5bc09116ba139b00abd2ed6d3fcf72cd9c2fb50d82558ba4e55')
sha256sums_i686=('3012fb51f372b6e4d586c6d9ae5ef19b2006f3bb9596fd80cddfaf3bf95646c9')
sha256sums_x86_64=('746c81ba2ebb096572808685db2d73be6474ac0f2df39b1528aa9e88931e00e0')
sha256sums_armv6h=('ec85fbfc91d3ee04183f2309b9d7eff586a7957ae68248ecf5842a9dc0f0075d')
sha256sums_armv7h=('bc5444aa49136cfe013f180eb78314afceeaffb7022fcf4a81ee65eb21909a8f')
sha256sums_aarch64=('07963491b2f69955a609a98ca15feac1b52bf4276861f7fd79480af9766efa2d')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
