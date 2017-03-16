# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver='1.1.2'
pkgrel=2
pkgdesc='A modern reverse proxy'
arch=('i686' 'x86_64')
url='https://github.com/containous/traefik'
license=('MIT')
install="${_pkgname}.install"
backup=(
  'etc/traefik/traefik.toml'
  'etc/logrotate.d/traefik'
)
source=(
  'traefik.install'
  'traefik.logrotate'
  'traefik.service'
  'traefik.toml'
  "https://raw.githubusercontent.com/containous/${_pkgname}/v${pkgver}/LICENSE.md"
)
source_i686=("${_pkgname}_i686_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-386")
source_x86_64=("${_pkgname}_x86_64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-amd64")
sha512sums=('de3e4cddedf05bdf182c31f4e1ff7ebe5a5ca425ea0669682054d699f96255f82ff84882fa151681bc7aa22dead48ba520a8a07f2e1d0f19ac840741c1b92f59'
            'd1dfacff1e7a5b9f8e8b4796fcfbb9c1bed6151013708078361ac31ae221dd956f746ec1e0bc5bd09a05763438d877318259577f6f0178d42f011bd737c31207'
            '1ba00b19f691e173eb1d69d2a3e1bcb95370025de49baf4f8024c30579cb58c6296ed743959f261b4ada6731f1c810ebe4eb0e3481e7eb17a9f09596fa004986'
            '05de0378cd4c430084c122dfcbb433c9cf8dda912dee03a5c80d1e199b133ecc0b32f6e8ae985544dca89355e21c23c8c4d04c05e1d0a72f5bf135db7fc724d2'
            '8ca3ccd49fccf47a67d6e80bd21ceec6a3968a9d3defd781862782cd4eb2a5763688fb028091548ed102c719267623f18f94fa532ee7a1673806246407e150e7')
sha512sums_i686=('e08ba5893c0781df3a51d91a25fef388f16ba4dfd5ed4630e54090cd393d8b7db051bc0531847d06e3135bc04a628b3bb76bfb5da8e4a29dea397cf01d0f273c')
sha512sums_x86_64=('02294f3fb021b0c84578285a17ca3f5b31be92d7547a155e69dea0ad0d9e53ef688fed080061849d9b6b77bbdc3cc272abbf0e771e7d3a3ef1ba89a9f6e2de25')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  chown traefik:traefik "${pkgdir}/var/log/${_pkgname}"
}
