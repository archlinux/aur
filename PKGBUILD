# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver='1.3.1'
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
source=(
  'traefik.logrotate'
  'traefik.service'
  'traefik.toml'
  "https://raw.githubusercontent.com/containous/${_pkgname}/v${pkgver}/LICENSE.md"
)
source_i686=("${_pkgname}_i686_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-386")
source_x86_64=("${_pkgname}_x86_64_${pkgver}"::"https://github.com/containous/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux-amd64")
sha512sums=('d1dfacff1e7a5b9f8e8b4796fcfbb9c1bed6151013708078361ac31ae221dd956f746ec1e0bc5bd09a05763438d877318259577f6f0178d42f011bd737c31207'
            '1ba00b19f691e173eb1d69d2a3e1bcb95370025de49baf4f8024c30579cb58c6296ed743959f261b4ada6731f1c810ebe4eb0e3481e7eb17a9f09596fa004986'
            '05de0378cd4c430084c122dfcbb433c9cf8dda912dee03a5c80d1e199b133ecc0b32f6e8ae985544dca89355e21c23c8c4d04c05e1d0a72f5bf135db7fc724d2'
            '5f61dc4f99314d659fbb9cbf3c665cd40ae76b3b2aea5bcb4409ceede088f9d6ed1ee83a2d460381b53ef3ee89a3e6be4fe8195f95b3001b6f9b63a5d92f6c32')
sha512sums_i686=('e7874f3b2aacd2a548b7f364c11bce00770daa51e6b594a397a9d77edcd848d4cb3951a9d619e2cfd5c39ae1ab431bc299447520969656a27aa6a80b8405be4b')
sha512sums_x86_64=('b522469a3759ce04cbce2c01871b307aeef0bb85bcfccabfa74260e226aa55cc99d41e224ba13e0a3cb81ec53d75b242c2dddd0c04718f30835a893cd17e4901')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
