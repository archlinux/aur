# Maintainer: abod8639 <https://github.com/abod8639>

pkgname=anodemcu
pkgver=3.0.1
pkgrel=1
pkgdesc="A powerful interactive shell script to manage MCU projects (Arduino, ESP-IDF, PlatformIO)"
arch=('any')
url="https://github.com/abod8639/${pkgname}"
license=('MIT')
depends=('arduino-cli' 'fzf' 'jq' 'neovim')
optdepends=()
source=("https://github.com/abod8639/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('412325608deffc6247f1c0510003adcba1ba67a0857d25b7bd49eb999a869067')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Define destination directory
  local _dest="${pkgdir}/usr/share/${pkgname}"
  install -d "${_dest}"
  
  # Install library files
  cp -r lib/ "${_dest}/"
  
  # Install the main script
  install -m755 "anodemcu" "${_dest}/"
  
  # Create a symlink in /usr/bin for global access
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/anodemcu" "${pkgdir}/usr/bin/${pkgname}"
  
  # Install documentation and license
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
