# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=1.7.6
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
sha512sums_i686=('1b03279b7ff87b718ec9db7c0fbd4b0d6f452f1c0857e0cb53c265d64812d0454840b4700900c0bbc8a04b0c9f5bfa30b27dfd2bc38d39b6f4a41d5e0729a6d2')
sha512sums_x86_64=('079cfbc9317b347edc083571dc8d6ce30da2ac4e4951cf200b02647dfc05c735d600f70cf3e6b9a0f486577a92e59f4d025cfcbfafb6d6fa3a56ee6effcda2db')
sha512sums_armv6h=('dee20cface97247f0a8233c9c9c84fb9fe8a6113b9ef105c397dc0ba13e0efb62ffe20b2ec71e94cf2e863f977e0b9b4e448853c85a3658e04725bce7255ea7c')
sha512sums_armv7h=('dee20cface97247f0a8233c9c9c84fb9fe8a6113b9ef105c397dc0ba13e0efb62ffe20b2ec71e94cf2e863f977e0b9b4e448853c85a3658e04725bce7255ea7c')
sha512sums_aarch64=('7ec51ff6bc0875faea4ed0c54ac26216da8f0dbfade99b6d429d618268602459c9aa24243f63f0e198b069deafd31a09585ec6abdcaea4b866e50ff6618004d1')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
