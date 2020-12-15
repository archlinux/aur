# Maintainer: etcusrvar <e t c u s r v a r at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=direnv-bin
_pkgname="${pkgname%-bin}"
pkgdesc='a shell extension that manages your environment'
pkgver=2.25.2
pkgrel=1
url='https://direnv.net'
_srcurl="https://github.com/direnv/direnv"
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}-${pkgver}.tar.gz::${_srcurl}/archive/v${pkgver}.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.linux-aarch64::${_srcurl}/releases/download/v${pkgver}/${_pkgname}.linux-arm64")
source_i686=("${_pkgname}-${pkgver}.linux-i686::${_srcurl}/releases/download/v${pkgver}/${_pkgname}.linux-386")
source_x86_64=("${_pkgname}-${pkgver}.linux-x86_64::${_srcurl}/releases/download/v${pkgver}/${_pkgname}.linux-amd64")
sha256sums=('c42624086c9fb5dd66e4d49e2a30907dd3038126a5dad3369c5a1c6f15d7b9ec')
sha256sums_aarch64=('40207418c1f1cc146a5a41a19925e00fbd16324ac1a983b5fc4c5f181f5bb1c8')
sha256sums_i686=('8f5e5dd140b81e467bab55fd13c1b0ae53ab1e19d12cea97d9ed269bef8efac6')
sha256sums_x86_64=('96ecaab50f50abec593914b4b85120370fcf433d188b22c29fa7bc8157c60189')
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
