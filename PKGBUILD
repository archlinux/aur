# Maintainer: etcusrvar <e t c u s r v a r at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=direnv-bin
_pkgname="${pkgname%-bin}"
pkgdesc='a shell extension that manages your environment'
pkgver=2.27.0
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
sha256sums=('9dc5ce43c63d9d9ff510c6bcd6ae06f3f2f907347e7cbb2bb6513bfb0f151621')
sha256sums_aarch64=('4b29068a239da7b6401bf894a22f88cffbdb80ba8f38dfb06d22033bcf14f004')
sha256sums_armv7h=('5fb176071d0caf2bec534e0076c070681394afbbb72862f117af1af2b9671c28')
sha256sums_i686=('24ed5c79596da68a54240c58f2b4766fae08c6a624c45701e3c7b2ced6c8fced')
sha256sums_x86_64=('86172548fbd738a852350b4633a67d93ead042df5fa2e61787677a1010f01b3d')
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
