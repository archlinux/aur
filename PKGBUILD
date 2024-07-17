# Maintainer: Eric Torres <eric.torres@its-et.me>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc='A modern reverse proxy written in Go'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/traefik/traefik'
license=('MIT')
install="${_pkgname}.install"
backup=(
  'etc/traefik/traefik.toml'
  'etc/traefik/traefik.yaml'
  'etc/traefik/traefik.yml'
  'etc/logrotate.d/traefik'
)
source=(
  'traefik.logrotate'
  'traefik.service'
  'traefik.toml'
)
source_i686=("${_pkgname}_i686_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_386.tar.gz")
source_x86_64=("${_pkgname}_x86_64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}_armv6h_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${_pkgname}_armv7h_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${_pkgname}_aarch64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('3e2746e3de4e79a957dc26cab98c680bba951ba64a7cbeb85bc85d7be1c4b51e'
            '75af40eb9788a000f8e9aa9a7e43bd2af5300e7df9178b9b158cf1d2052eb3b0'
            'abfcfe24e742bf8968749ea79e2c0425bef3d37d16eb60311b5a994312a1e54d')
sha256sums_i686=('ccfa8be0ff782052a2204195715012953af1afb78adbbbc34055b5c2f7a3bdab')
sha256sums_x86_64=('9d52676fda789fc0566d07fe09115c42d56527b7cdba3ea7c40088b4053f97f5')
sha256sums_armv6h=('0cd714b4f7014ff3893a4d4896c57fb66b83b03a587027eb617281341876172b')
sha256sums_armv7h=('90bfb38fd8f0bba57bda46d49051c525b4f461225e0c03b71b633613dc1292c8')
sha256sums_aarch64=('6793de165d84b41dcee21e07fb90b4a9bacaa5580790d0be8af72a158afc2767')

package() {
  cd "${srcdir}"
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
