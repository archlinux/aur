# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=blogsync-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Push and pull blog entries between a blog and the local filesystem"
arch=('x86_64' 'aarch64')
url="https://github.com/x-motemen/blogsync"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/blogsync_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/blogsync_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('01f0ef3786007004edf1f7a611181ea2db08541b927907aae27bff827b212975')
sha256sums_aarch64=('fa5aab973226a40e1361af8e53d8ca7e3bf9bb616be1642b81bd9ceb9ca97659')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="blogsync_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="blogsync_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/blogsync" "${pkgdir}/usr/bin/blogsync"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
