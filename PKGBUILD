# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=comfygit-bin
pkgver=0.39.1
pkgrel=1
pkgdesc="All-In-One: Centralised multi-project management, Changelog generator"
arch=('x86_64' 'aarch64')
url="https://github.com/comfy-home/ComfyGit"
license=('LicenseRef-SA-PS')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/comfygit-${pkgver}-linux-amd64-portable.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/comfygit-${pkgver}-linux-arm64-portable.tar.gz")
sha256sums_x86_64=('ffb01aee3e8ec7bffa2ced4ff9f86f80684a38819c885899a28f59f3155e44bf')
sha256sums_aarch64=('e4d9a68bcfa8094488d67e8dd31669951e4ccf98fe87a48662d7e196d97efdc6')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="comfygit-${pkgver}" ;;
    aarch64) _dir="comfygit-${pkgver}" ;;
  esac
  cd "$_dir"
  install -Dm755 "ComfyGit" "${pkgdir}/usr/bin/ComfyGit"
  install -Dm644 "shell/cg.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
