# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=commandok-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="A Spotlight-like terminal command generator powered by major large-language-model providers"
arch=('x86_64' 'aarch64')
url="https://github.com/64bit/commandOK"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/commandok-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/commandok-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('2b34ae0eaa2dd5616eca344ba6c580dfff1e718f09348dc8635a5718a98cb658')
sha256sums_aarch64=('d37d9aca6427f9b87b86fcdf98403ca7a5ec95ab16109d2ec37fe300c7372225')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="commandok-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="commandok-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "commandok" "${pkgdir}/usr/bin/commandok"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
