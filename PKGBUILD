# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=toptop-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="System monitor with a local-inference view: live tokens/sec, GPU compute-vs-bandwidth"
arch=('x86_64' 'aarch64')
url="https://github.com/ur-grue/toptop"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/toptop-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/toptop-${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('9355ce7d26652220b1b9f675a3721d1f78d675a74d2754af6d39d5a94933dac3')
sha256sums_aarch64=('dca496e25075842744401c5d3383b5295d2bc44a89eae69728f4a6d6eb1ab294')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="toptop-${pkgver}-x86_64-linux" ;;
    aarch64) _dir="toptop-${pkgver}-aarch64-linux" ;;
  esac
  cd "$_dir"
  install -Dm755 "toptop" "${pkgdir}/usr/bin/toptop"
  install -Dm644 "toptop.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "completions/toptop.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 "completions/_toptop" "${pkgdir}/usr/share/zsh/site-functions/_toptop"
  install -Dm644 "completions/toptop.bash" "${pkgdir}/usr/share/bash-completion/completions/toptop"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
