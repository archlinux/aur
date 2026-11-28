# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opensave-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Peer-to-peer game save sync"
arch=('x86_64' 'aarch64')
url="https://github.com/Liquid-co/OpenSave"
license=('MIT')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsoup3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Liquid-co/OpenSave/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/opensave-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/opensave-linux-arm64.tar.gz")
sha256sums=('fb7fe6dc0a8ff110a5da8e8c06dab2faa4dea4a4d73f40bf85256bfc956066cc')
sha256sums_x86_64=('061f620863aa8db46f41c0ab89bf899fd29b163cb996b0080f3a067c675226b2')
sha256sums_aarch64=('06d9a22df02385640da5ceb3436446b76ae9fc02f87bea0a177e7c3c6e1adf5d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="opensave-linux" ;;
    aarch64) _dir="opensave-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/opensave-relay" "${pkgdir}/usr/bin/opensave-relay"
  install -Dm755 "${_dir}/opensave" "${pkgdir}/usr/bin/opensave"
  install -Dm755 "${_dir}/opensave-cli" "${pkgdir}/usr/bin/opensave-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
