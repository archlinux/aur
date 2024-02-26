# Maintainer: Simon <simon at gamersi dot at>
pkgname=lrcget-bin
pkgver=0.3.0
pkgrel=2
options=(!strip)
pkgdesc="Utility for mass-downloading LRC synced lyrics for your offline music library."
arch=('x86_64')
url="https://github.com/tranxuanthang/lrcget"
license=('MIT')
install_path="/opt/lrcget"
depends=('hicolor-icon-theme' 'zlib' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://github.com/tranxuanthang/lrcget/releases/download/${pkgver}/lrcget_${pkgver}_amd64.AppImage")
b2sums=('SKIP')

prepare() {
  cd "${srcdir}"
  chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
  "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract
}

package() {
  mkdir -p "${pkgdir}${install_path}"
  echo "Installing ${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage to ${pkgdir}${install_path}"
  cp ${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage ${pkgdir}${install_path}/${pkgname%-appimage}-${pkgver}.AppImage
  
  mkdir -p "${pkgdir}/usr/bin"
  cp "${pkgdir}${install_path}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/usr/bin/lrcget"

  for _icons in 32x32 128x128 256x256@2;do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/lrcget.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
  done
  install -Dm644 "${srcdir}/squashfs-root/lrcget.desktop" -t "${pkgdir}/usr/share/applications"
}
