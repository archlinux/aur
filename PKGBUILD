# Maintainer: Auditor_3D <06wiretap.loud@icloud.com>
_pkgname=landropv2
pkgname="${_pkgname}-appimage"
pkgver=2.1.2
pkgrel=1
pkgdesc="Drop any files to any devices on your LAN."
arch=('x86_64')
url="https://releases.landrop.app/LANDrop-latest-linux.AppImage"
url="https://github.com/LANDrop/LANDrop/blob/master/LANDrop/icons/app.png"
license=('custom:Unlicense')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
icon=LANDrop.svg

source_x86_64=(
    "${_appimage}::https://releases.landrop.app/LANDrop-latest-linux.AppImage"

)
noextract=("${_appimage}")
sha256sums_x86_64=('246b3c2535b6de9a1cf038f378ed027a7094c6d315798400bff30791d51ea93f')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm755 "${srcdir}/squashfs-root/usr/share/applications/LANDrop.desktop" "${pkgdir}/usr/share/applications/LANDrop.desktop"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
 
  mkdir -p "${pkgdir}/usr/bin"
  touch "${pkgdir}/usr/bin/LANDrop"
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/LANDrop"
  echo '/opt/landropv2-appimage/landropv2-appimage.AppImage $1' >> "${pkgdir}/usr/bin/LANDrop"

  chmod +x "${pkgdir}/usr/bin/LANDrop"

  mkdir -p "${pkgdir}/usr/share/applications"
  touch "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Name=LANDrop" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Exec=LANDrop" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Icon=LANDrop" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Type=Application" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  echo "Categories=Network;Utility" >> "${pkgdir}/usr/share/applications/LANDrop.desktop"
  
  


}
