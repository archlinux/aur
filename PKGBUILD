# Maintainer: etcusrvar <e t c u s r v a r at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=direnv-bin
_pkgname="${pkgname%-bin}"
pkgdesc='a shell extension that manages your environment'
pkgver=2.26.0
pkgrel=1
url='https://direnv.net'
_srcurl="https://github.com/direnv/${_pkgname}"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}-${pkgver}.tar.gz::${_srcurl}/archive/v${pkgver}.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.linux-aarch64::${_srcurl}/releases/download/v${pkgver}/${_pkgname}.linux-arm64")
source_armv7h=("${_pkgname}-${pkgver}.linux-armv7h::${_srcurl}/releases/download/v${pkgver}/${_pkgname}.linux-arm")
source_i686=("${_pkgname}-${pkgver}.linux-i686::${_srcurl}/releases/download/v${pkgver}/${_pkgname}.linux-386")
source_x86_64=("${_pkgname}-${pkgver}.linux-x86_64::${_srcurl}/releases/download/v${pkgver}/${_pkgname}.linux-amd64")
sha256sums=('b3dbb97f4d2627ec588894f084bfdc76db47ff5e3bec21050bb818608c7835b9')
sha256sums_aarch64=('65fd7b629e312ae81c7a8c8b0d0bf990bf60a0bea0c51863bd3d2e2b59d17a2b')
sha256sums_armv7h=('1557a447003e840885a5245f1518ab916fe0205ae2bd2b9bfaf8f2dce47ee0ba')
sha256sums_i686=('3a3f3c1bd354e94c178014d6996040354352c215db41d4d94fa9f0abfbf1f2f1')
sha256sums_x86_64=('fc365358a320692642ba13fffdcb7c439744d2739ea20740b24d0d453f108a28')
_="${pkgdir:-}"

package() {

  install -Dm755 "${_pkgname}-${pkgver}.linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${_pkgname}-${pkgver}" || exit

  for f in man/*.1; do
    install -Dm644 "$f" "${pkgdir}/usr/share/man/man1/${f##*/}"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set ts=2 sw=2 et:
