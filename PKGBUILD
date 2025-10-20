# Maintainer: Coffee Bean <beanc904@gmail.com>
# Contributor: jackreeds
pkgname=neovide-bin
_pkgname=neovide
pkgver=0.15.2
pkgrel=1.1
pkgdesc="No Nonsense Neovim Client in Rust"
arch=(x86_64)
url="https://github.com/neovide/neovide"
license=('MIT')
depends=(
  neovim
  gcc-libs
  fontconfig
  freetype2
  expat
  zlib
  bzip2
  libpng
  brotli
)
# install=.install
source=("${_pkgname}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}.AppImage")
sha256sums=(3c1d694e2529e899157cf0fd5e01fcd0fb12f56e8f8f9336e4337c1abc7875c3)

package() {
  chmod +x ${_pkgname}.AppImage
  ./${_pkgname}.AppImage --appimage-extract
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  mkdir -p "${pkgdir}/usr/local/bin"
  ln -sf "/usr/bin/neovide" "${pkgdir}/usr/local/bin/vide"
}

