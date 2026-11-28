# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rutis-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="Plugin runtime where AI agents write and hot-reload their own plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/arcships/rutis"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rutis-host-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rutis-host-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('ce82acd61dc29bdba30b5f3c2e19c092313822cc46c15c0f7e91007d2329bbde')
sha256sums_aarch64=('9a0df44a7b844b2a941a5c5860866c73477bbf12b4ec65f3bfaa42fb2453fa07')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rutis-host-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="rutis-host-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/rutis-host" "${pkgdir}/usr/bin/rutis-host"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
