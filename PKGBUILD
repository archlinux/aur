# Maintainer: Eric Torres <eric.torres@its-et.me>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=3.1.1
pkgrel=1
pkgdesc='A modern reverse proxy written in Go'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/traefik/traefik'
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
install="${_pkgname}.install"
backup=(
  'etc/traefik/acme.json'
  'etc/traefik/traefik.toml'
  'etc/traefik/traefik.yaml'
  'etc/traefik/traefik.yml'
  'etc/logrotate.d/traefik'
)
source=(
  'traefik.logrotate'
  'traefik.service'
  'traefik.sysusers'
  'traefik.toml'
)
source_i686=("${_pkgname}_i686_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_386.tar.gz")
source_x86_64=("${_pkgname}_x86_64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}_armv6h_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${_pkgname}_armv7h_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${_pkgname}_aarch64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('da59d047177cae773d248684e8484d91c71201f5bc07fe72452efdf9bed1a7f4'
            '42f46aa462f7347cc63f4a88e38ba9cebeab9f6bcb4f6f3717dafd17a8018e56'
            '9acc04ac38893d05c5f3b1407fbc36d5f7ae179af5f13e12231194f1f469390d'
            'abfcfe24e742bf8968749ea79e2c0425bef3d37d16eb60311b5a994312a1e54d')
sha256sums_i686=('9de951355547db3039dd0fe17a6b7e95f8a31d31b6b48e8ce6807ae0ae715e76')
sha256sums_x86_64=('d89c2e6e34f7bf3e6e7e621dfdb809c0e68dbed8164423c58ab912716e566fe8')
sha256sums_armv6h=('8319e52f1dde5691f8dd1d7e00684a3d766e4703941f317ed216bc67a661b6d4')
sha256sums_armv7h=('84f1b66ed8be3c9e4d088df299deec18d65fba48326382f7b2e69871f8e6e9f9')
sha256sums_aarch64=('e23ad1706e354efed8b58a9225dd315580b2d6db849089da4bf255f083b56578')

package() {
  cd "${srcdir}"
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "traefik.sysusers" "${pkgdir}/usr/lib/sysusers.d/traefik.conf"
  install -D -m644 "traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # create empty acme.json file, otherwise the service file will fail
  install -Dm600 /dev/null "${pkgdir}/etc/traefik/acme.json"
}
