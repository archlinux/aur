#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=Cinelerra-GG
pkgname=cin-appimage
pkgver=20220731
pkgrel=0
pkgdesc="Cinelerra GG Infinity (AppImage) is a free and open source video editing software for Linux."
arch=('x86_64')
#url="https://www.cinelerra-gg.org"
license=('GPL')
provides=('cinelerra-gg')
conflicts=(cinelerra-gg-git cin)
source=("https://cinelerra-gg.org/download/images/CinGG-${pkgver}-${arch}.AppImage")
md5sums=('d7f94ec321a3bd2350374d05feb0de7d')
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
