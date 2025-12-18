# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Marco Kage <marco.kage at outlook dot com>

_pkgauthor=stashapp
_pkgname=stash
pkgname=${_pkgname}-bin
pkgver=0.30.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="An organizer for your porn, written in Go"

arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('AGPL-3.0-or-later')

depends=('ffmpeg')
provides=("${_pkgname}")
conflicts=("${_pkgname}")


source=("${_pkgname}.service"
        "${_pkgname}-user.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${_pkgname}.env"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux")
source_aarch64=("${pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-arm64v8")
source_armv7h=("${pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-arm32v7")

sha256sums=('06ff18ccab55933fa568a05f280709de839d98979b6cf85217ffb252728b8840'
            '41f79ebc8d24cb1ae87ba55923d56e6d5c6bff9fa62433070fdf37ff5a52f7fd'
            'de94761e4a705c6fa7216359d5286c4724c985818b21ed071d3866246fffd870'
            '7aac9c11831133f271c52bc432bd68a3eeb48afa9f0affa0486e57a693abf862'
            '4f6add7bf6d1be8dc5df5f6117b7288a2c9d4ba97fd784bc05c197673353de85'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '7a4c7dcadab6d245cce4d06d7769719f83ed9131cc178181f76f3b89b810f830')
sha256sums_x86_64=('710a33233d0c8e6cd904e12cd2a8f3f1c84603db614b5c54e2afce928651a45e')
sha256sums_aarch64=('9de8b4f841f5cb6151da18ca4c173c986e44b519726425e1a15dddc49ad07d2d')
sha256sums_armv7h=('be6de09788023a01573de8374ebe8fd85fb30ee8979d7e8d6b181d04f03a4f60')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${_pkgname}-user.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
  install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm644 "${_pkgname}.env" "${pkgdir}/etc/conf.d/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
