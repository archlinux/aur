# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname='traefik'
pkgname="${_pkgname}-bin"
pkgver=1.5.3
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
sha512sums_i686=('c4c081df067876234490705b16921f3ad0b9313a92b0e7b08dd4e5c62fd827081f275a4fcf1c82ef0c7ef91e27a9bf86dc0969b6bebb1277254cd4773236f99c')
sha512sums_x86_64=('42f503a873bc092fd4c8ed544d62f06b6a1239e0fdd9a0100d02e8793f9336aecb907caaa5acb0a330c73f53f6ec16328bcaf2d7daa6c3af76a5d55f680ea6d2')
sha512sums_armv6h=('7e74b1a069cf9e2bdfec0660364d29fb3fa8a11d957496104aa55c15dd853e2daee229616854deb88d4452fb74ba9e1b0d75c9fe5bc483f9a88b306ca1c51e3f')
sha512sums_armv7h=('7e74b1a069cf9e2bdfec0660364d29fb3fa8a11d957496104aa55c15dd853e2daee229616854deb88d4452fb74ba9e1b0d75c9fe5bc483f9a88b306ca1c51e3f')
sha512sums_aarch64=('6f3579bc6b08a509526227934fbb2d673093e67b9b07061b3e093fdf75b37789da836e8d658e047590012a741e82ac2213504b101ce1d3a3d18ee48c4223f0da')

package() {
  install -d -m755 "${pkgdir}/var/log/traefik"

  install -D -m644 "${srcdir}/traefik.logrotate" "${pkgdir}/etc/logrotate.d/traefik"
  install -D -m644 "${srcdir}/traefik.service" "${pkgdir}/usr/lib/systemd/system/traefik.service"
  install -D -m644 "${srcdir}/traefik.toml" "${pkgdir}/etc/traefik/traefik.toml"

  install -D -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 "${srcdir}/${_pkgname}_${CARCH}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
