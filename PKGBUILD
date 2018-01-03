# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=1.4.6
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
sha512sums_i686=('be8374bb72facd26c175715ae5d804a40d72b2c5b42c9476ed0fc56c20d76355c1e8dda717c97278432e14352c434c742534fd24ac37863f5b7104bd6f138d49')
sha512sums_x86_64=('164e125970cd45aa71dc74523920bee4a913ac493f214579736109c237607f3dcc3e8f621032cdda7468166dca60e2ea2a4446e7579c0f4d55c601004f8b12e9')
sha512sums_armv6h=('7211d8eaa13cd2f0d32e92f2fdd1ae502dee047220e87ec7558b3a605bc875608d7e52be75fcebe36b69b196a1bd905508b9b40a0ee6817cc11b83734ad69567')
sha512sums_armv7h=('7211d8eaa13cd2f0d32e92f2fdd1ae502dee047220e87ec7558b3a605bc875608d7e52be75fcebe36b69b196a1bd905508b9b40a0ee6817cc11b83734ad69567')
sha512sums_aarch64=('13484614f77a4a25f0805c7983ece212e0f164be3d6ad3137e684ef5dc1bce96f099297d76c4a2052b1622f11d3eb110438895bb81b8dd6f4f646dc53ce31e2d')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
