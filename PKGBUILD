#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=Cinelerra-GG
pkgname=cin-appimage
pkgver=20260331
pkgrel=1
pkgdesc="Cinelerra GG Infinity (AppImage) is a free and open source video editing software for Linux."
arch=('x86_64')
url="https://www.cinelerra-gg.org"
license=('GPL-2.0-only')
provides=('cinelerra-gg')
conflicts=(cin)
source_x86_64=("https://download.cinelerra-gg.org/download.php?file=images/CinGG-${pkgver}-${arch}.AppImage")
# http://download.cinelerra-gg.org/download.php?file=images/CinGG-20251121-x86_64.AppImage
sha256sums_x86_64=('2f72db50c085924df9d6215462f0130a59b94fb55477534f2f9a101d2bd8ea3b')
options=(!strip)
_filename=CinGG-${pkgver}-${arch}.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ./${_filename} --appimage-extract
   rm "${srcdir}/squashfs-root/usr/share/applications/cin.desktop"
touch "${srcdir}/squashfs-root/usr/share/applications/Cinelerra-GG.desktop"
echo "[Desktop Entry]
Name=Cinelerra-GG
Comment=MultiMedia Editor
Comment[fr]=Éditeur multimédia
Categories=AudioVideo;AudioVideoEditing;
Encoding=UTF-8
Exec=/opt/appimages/Cinelerra-GG.AppImage
Icon=cin
Terminal=false
Type=Application
StartupWMClass=Cinelerra" >> "${srcdir}/squashfs-root/usr/share/applications/Cinelerra-GG.desktop"

}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"

  install -Dm755 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/cin.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cin.svg"
  install -Dm755 "${srcdir}/squashfs-root/usr/share/applications/Cinelerra-GG.desktop" "${pkgdir}/usr/share/applications/Cinelerra-GG.desktop"
  
}
