# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-purge-bin
pkgver=0.2.39
pkgrel=1
pkgdesc="One persona, many coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/ZiChuanLan/agent-purge"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agent-purge-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agent-purge-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('db8fb16dd9579d52dd4da1a9c71b9e2d544e3ded44d1e2030dcc7dbe86f8df68')
sha256sums_aarch64=('291e72b92cc583c1b92f008b8fc66a94c78c83f4a766311c0dd97e50eba00e84')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="agent-purge-${pkgver}-linux-x64" ;;
    aarch64) _dir="agent-purge-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/agent-purge" "${pkgdir}/usr/bin/agent-purge"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
