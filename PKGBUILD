# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=1.6.2
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
source_i686=("${_pkgname}_i686_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-386")
source_x86_64=("${_pkgname}_x86_64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-amd64")
source_armv6h=("${_pkgname}_armv6h_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-arm")
source_armv7h=("${_pkgname}_armv7h_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-arm")
source_aarch64=("${_pkgname}_aarch64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-arm64")
sha512sums=('d1dfacff1e7a5b9f8e8b4796fcfbb9c1bed6151013708078361ac31ae221dd956f746ec1e0bc5bd09a05763438d877318259577f6f0178d42f011bd737c31207'
            '1ba00b19f691e173eb1d69d2a3e1bcb95370025de49baf4f8024c30579cb58c6296ed743959f261b4ada6731f1c810ebe4eb0e3481e7eb17a9f09596fa004986'
            '05de0378cd4c430084c122dfcbb433c9cf8dda912dee03a5c80d1e199b133ecc0b32f6e8ae985544dca89355e21c23c8c4d04c05e1d0a72f5bf135db7fc724d2'
            '4988480b6057b0e36e74cd0c905e1e26767af047b00aebd888ae3fde4aaa6e9c8946c874efc698bdc6bbb6933f27ef074c366450e39cbdcad369f0107abddffd')
sha512sums_i686=('b9b21db2ee8c64e11dd634af2874abb8ca110183359b82bf146fca85b42ad8297586216f5765d88113390b1e8287b75fc6eeaf0a8b4878e2766ec9b4dd7ebfed')
sha512sums_x86_64=('d45021a083c6721a57fc5ba6a21e652fcd9a5b6f6092bb80b9c33a9fb288b0e98e34cdc7ea6859c7f7127aba4c5cc51526bc05947a6919269a421f2132bc89a7')
sha512sums_armv6h=('f17fc70b1a6b0d65231f427192de99070b972c2337aec664ae892d928151ee13255857731dc1a1a10773968b44dbaa4aa412cc06af74ed04dc6393e2927866b2')
sha512sums_armv7h=('f17fc70b1a6b0d65231f427192de99070b972c2337aec664ae892d928151ee13255857731dc1a1a10773968b44dbaa4aa412cc06af74ed04dc6393e2927866b2')
sha512sums_aarch64=('742a1f3d78b79c65de33bae70d43f9c215195914f329eb357fe51c4d5d52c9ccd2a3cc03d33c335f48fffa6f3a9714ab984ddb7043318413af718d116cb75e1b')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
