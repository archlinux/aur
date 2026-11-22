# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=noctavox-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="A lightweight, customizable TUI music player for local files"
arch=('x86_64' 'aarch64')
url="https://github.com/Jaxx497/noctavox"
license=('MIT')
depends=('alsa-lib' 'dbus' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Jaxx497/noctavox/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/noctavox-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/noctavox-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('7cbc985f885351ef59496d7c7cce3f5ed6e12c70019a99fb00d45ab24ae668ed')
sha256sums_x86_64=('149067ee1edacb8637a0a1d8666ed6a729944b23b1104f6d8bb3112ac7dcf074')
sha256sums_aarch64=('fb671882c564ac18b16357f38ce29230d33dfaac7a667198b29e3fd5f1178d49')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="noctavox-v${pkgver}-linux-x64" ;;
    aarch64) _dir="noctavox-v${pkgver}-linux-arm64" ;;
  esac
  cd "$_dir"
  install -Dm755 "vox" "${pkgdir}/usr/bin/vox"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
