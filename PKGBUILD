# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=1.7.13
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
sha512sums_i686=('821a16dc3312fbef4f87ab96fc05291ec03b17d5fc77f50a7ea5bb9bcde270b46cea05d9eb201a613081e5fa363ab25ece18849ac88490c53696b9321cad56f6')
sha512sums_x86_64=('ffda01bf0ebd33c693fe83ba3f107fff6655a59aec89ff25af233e482b315aa877b63e476e8b078259f9afa82f5788875b1d67942cca81048477940480dd9427')
sha512sums_armv6h=('bc824e66def422cd7e18d01a4584936d61463b388b8aef59bba4fe27a59e509bc133d27280649d42c12346183410d0093886362e63b4b8ce0e64dfa70b6406ab')
sha512sums_armv7h=('bc824e66def422cd7e18d01a4584936d61463b388b8aef59bba4fe27a59e509bc133d27280649d42c12346183410d0093886362e63b4b8ce0e64dfa70b6406ab')
sha512sums_aarch64=('b35e45377bc268d7d9b3c9c0284993387908ce29bb4954dd80e89f712b480359aa86f3c405a565bbb010ba1558219155d3e1ee28dd92584efd00de624cfb5922')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
