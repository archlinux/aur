# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pgmon-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A TUI for monitoring PostgreSQL databases"
arch=('x86_64' 'aarch64')
url="https://github.com/nbari/pgmon"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nbari/pgmon/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pgmon-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pgmon-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('04a054f6b24acdc987657cc2f2452b795e76dc2695431e5b8011b30220bff548')
sha256sums_x86_64=('4de763d2915e7d84dcdb9153c0f41290d22d3ede5f6d652c0e0a89d0d11d6d4e')
sha256sums_aarch64=('8b1d5b6aac9db2de5e2620d487233e38ba000a0a72b72a1fb4acb3a7eb1fce1c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="pgmon-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="pgmon-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  cd "$_dir"
  install -Dm755 "pgmon" "${pkgdir}/usr/bin/pgmon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
