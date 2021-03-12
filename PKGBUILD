# Maintainer: etcusrvar <e t c u s r v a r at gmail dot com>
# shellcheck shell=bash disable=SC2034

pkgname=direnv-bin
_pkgname="${pkgname%-bin}"
pkgdesc='a shell extension that manages your environment'
pkgver=2.28.0
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
sha256sums=('fa539c63034b6161d8238299bb516dcec79e8905cd43ff2b9559ad6bf047cc93')
sha256sums_aarch64=('5828312615d176ee56526d8f23bbacd4967cad4a17d4de718342912ee439886c')
sha256sums_armv7h=('3decca451a9ca26fdd03d1f392f547db0256c8dfe112211451b6eed9321479cb')
sha256sums_i686=('a21166ca17416b20ded4bf9b9aa4a48b0fc02352aa8d2454cbd56b5ed22df649')
sha256sums_x86_64=('74ed5e5b29b56331c9ed821b633f2ebcc9bd8c94d068ae1274c36be597991b18')
_="${pkgdir:-}"

package() {

  install -Dm755 "${_pkgname}-${pkgver}.linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${_pkgname}-${pkgver}" || exit

  for f in man/*.1; do
    install -Dm644 "$f" "${pkgdir}/usr/share/man/man1/${f##*/}"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  echo "/usr/bin/direnv hook fish | source" | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_conf.d/direnv.fish"

}

# vim:set ts=2 sw=2 et:
