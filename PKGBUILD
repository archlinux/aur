# Maintainer: duanluan <duanluan@outlook.com>

pkgname=navicat17-premium-cs
pkgver=17.3.8
pkgrel=2
pkgdesc='Navicat Premium is a multi-connection database development tool. (Chinese Simplified)'
arch=('x86_64')
url='https://www.navicat.com.cn/products/navicat-premium'
license=('NOASSERTION')
options=('!strip')
source_x86_64=("navicat17-premium-cs-${CARCH}-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-x86_64.AppImage")
sha256sums_x86_64=('0d49ec692c09298ac76ba87acf85bdb6aab0ca293644092497ab0f4ca65aac6e')

package() {
  cd "${srcdir}"

  chmod +x "${srcdir}/navicat17-premium-cs-${CARCH}-${pkgver}.AppImage"
  "${srcdir}/navicat17-premium-cs-${CARCH}-${pkgver}.AppImage" --appimage-extract

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/"

  # Prefer Arch's system copies for these low-level libraries to avoid
  # symbol-version conflicts with host libmount/libudev users.
  rm -f     "${pkgdir}/opt/${pkgname}/usr/lib/libsystemd.so"*     "${pkgdir}/opt/${pkgname}/usr/lib/libudev.so"*     "${pkgdir}/opt/${pkgname}/usr/lib/libblkid.so"*     "${pkgdir}/opt/${pkgname}/usr/lib/libselinux.so"*

  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/navicat.desktop"     "${pkgdir}/usr/share/applications/navicat.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/navicat"
}
