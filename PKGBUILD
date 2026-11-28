# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pysentry-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Scan Python dependencies for known vulnerabilities"
arch=('x86_64' 'aarch64')
url="https://github.com/nyudenkov/pysentry"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pysentry-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pysentry-linux-arm64.tar.gz")
sha256sums_x86_64=('bd4b00d01cfda1475a9f1806d539fbdfff697af25ba2b53ffc5de587fffced0f')
sha256sums_aarch64=('9fbaff0d5a7ea7edff13cea73fd25e3b36b83e9a36e388b306c8cf3578c4a183')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="pysentry-linux-x64" ;;
    aarch64) _dir="pysentry-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/pysentry" "${pkgdir}/usr/bin/pysentry"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
