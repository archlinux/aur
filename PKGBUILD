# Maintainer: Marco Kage <marco.kage at outlook dot com>

_pkgauthor=stashapp
_pkgname=stash
pkgname=${_pkgname}-bin
pkgver=0.29.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('AGPL-3.0')

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
            'd3ce0f50617c57d226a8ced7549c640a8278ad20af234616dfad6b000db2f399')
sha256sums_x86_64=('5fe969833585f1155e1bc69f3978191f64ba58348a9e97ca79b5d6bb30497bf4')
sha256sums_aarch64=('835ee37ecd3af52ebb157d12eaa94ab61355fac1989fcd0fa481466302cbbd99')
sha256sums_armv7h=('9375c242b22974688f0ed35c724a53e4fdadcbd39ef65f9127fd185114b20d03')


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
