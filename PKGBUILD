# Maintainer: etcusrvar <e t c u s r v a r at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=direnv-bin
_pkgname="${pkgname%-bin}"
pkgdesc='a shell extension that manages your environment'
pkgver=2.25.0
pkgrel=6
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
sha256sums=('f1100333be9045e83285a175a0937b96fd9d211519333234815eb4aa7c719f5b')
sha256sums_aarch64=('2b13708f0dd2a11cab1159533322271e9bf671415d88121fdaacfd2b3fa7c109')
sha256sums_i686=('d8d33b014c44a1ec0418103168004a7044e98b19f0d2e5b03b3c26f115bbc60d')
sha256sums_x86_64=('3a639ddb7a4d29589ca9aaf44de90873f98937ca78d922e5f51a8f3f9c3b2a25')
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
