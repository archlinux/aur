# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver='1.1.2'
pkgrel=1
pkgdesc='A modern reverse proxy'
arch=('i686' 'x86_64')
url='https://github.com/containous/traefik'
license=('MIT')
install="${_pkgname}.install"
backup=(
  'etc/traefik/traefik.toml'
  'etc/logrotate.d/traefik'
)
source_i686=(
  "${_pkgname}_i686_${pkgver}"::"https://github.com/containous/traefik/releases/download/v${pkgver}/${_pkgname}_linux-386"
  "https://raw.githubusercontent.com/containous/traefik/master/LICENSE.md"
)
source_x86_64=(
  "${_pkgname}_x86_64_${pkgver}"::"https://github.com/containous/traefik/releases/download/v${pkgver}/${_pkgname}_linux-amd64"
  "https://raw.githubusercontent.com/containous/traefik/master/LICENSE.md"
)
sha512sums_i686=(
  'e08ba5893c0781df3a51d91a25fef388f16ba4dfd5ed4630e54090cd393d8b7db051bc0531847d06e3135bc04a628b3bb76bfb5da8e4a29dea397cf01d0f273c'
  '8ca3ccd49fccf47a67d6e80bd21ceec6a3968a9d3defd781862782cd4eb2a5763688fb028091548ed102c719267623f18f94fa532ee7a1673806246407e150e7'
)
sha512sums_x86_64=(
  '02294f3fb021b0c84578285a17ca3f5b31be92d7547a155e69dea0ad0d9e53ef688fed080061849d9b6b77bbdc3cc272abbf0e771e7d3a3ef1ba89a9f6e2de25'
  '8ca3ccd49fccf47a67d6e80bd21ceec6a3968a9d3defd781862782cd4eb2a5763688fb028091548ed102c719267623f18f94fa532ee7a1673806246407e150e7'
)

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "../traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "../traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "../traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
