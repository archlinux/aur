# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=1.4.3
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
            '5f61dc4f99314d659fbb9cbf3c665cd40ae76b3b2aea5bcb4409ceede088f9d6ed1ee83a2d460381b53ef3ee89a3e6be4fe8195f95b3001b6f9b63a5d92f6c32')
sha512sums_i686=('e8e56c0b71ff7697282ca10453abcb461cf3988820c831b67f0eb1a0624ac124c6ac96dab29cbb88cc6a433e6fb0d9b233f25b69a8ce9723f3bba1ac63652189')
sha512sums_x86_64=('2ecb897d7b4f1e7c4236d3b6fb91cb3ff3c9e9be44f39d6c275864bb288ff4ea95487eb2fb5c47bd8f63c1445125ee99dbac084992df48ba260f7e3344206dd6')
sha512sums_armv6h=('29efb1b3cc5f2344a5243e3f9f660c065a9a4651e1876602c3db6787aeaa5d6a16214fb98f13b60d4da97fbd4156d923296db404ce5dd45c19e89391f7e19223')
sha512sums_armv7h=('29efb1b3cc5f2344a5243e3f9f660c065a9a4651e1876602c3db6787aeaa5d6a16214fb98f13b60d4da97fbd4156d923296db404ce5dd45c19e89391f7e19223')
sha512sums_aarch64=('5489608739e94a7eb3e493a7a7f510bbee6a49a409bf4ced75f1c53a8fc793ab1336d2cae75739dd6c45cd528600c757cabb44782d3021b9519607a7c3ef4e60')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
