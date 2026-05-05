#  Maintainer: John Machado <john at delinuxco dot com>

_pkgname=MuseScore-Studio
pkgname=musescore-studio-appimage
pkgver=4.6.5.253511702
pkgrel=3
pkgdesc="Create and share sheet music"
arch=('x86_64')
url=https://musescore.org/en/download
license=('GPL-v3')
provides=('mscore')
conflicts=('musescore-bin' 'musescore-git')
depends=(
    'fuse-common'
    'fuse2'
    'fuse3'
)
makedepends=()
_filename="${_pkgname}-${pkgver}-${arch}.AppImage"
source_x86_64=("${_filename}::https://cdn.jsdelivr.net/musescore/v4.6.5/MuseScore-Studio-${pkgver}-x86_64.AppImage")
#                             https://cdn.jsdelivr.net/musescore/v4.6.5/MuseScore-Studio-4.6.5.253511702-x86_64.AppImage
sha256sums_x86_64=('193daa0ea18bcfa90a47145a842275b8069b7b2b8d153e562b15fab5fe50fcaf')
options=(!strip)
prepare() 
{
  cd "${srcdir}"
  chmod +x ${_filename}
  ./${_filename} --appimage-extract

#  eval ./${_filename} --appimage-extract "*/*/*/*/*x*/apps/*.png"
#  eval ./${_filename} --appimage-extract "*/*/applications/*.desktop"


    sed -i -E 's|Exec=mscore4portable %U|Exec=env QT_SCALE_FACTOR=1.2 /opt/appimages/musescore-studio.AppImage %U|g' "${srcdir}/squashfs-root/usr/share/applications/org.musescore.MuseScore4portable.desktop"
}

package() 
{
  # Install AppImage
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/musescore-studio.AppImage"


  # Install global Desktop-Integration
   install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/mimetypes/application-x-musescore4portable.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mscore4portable.svg"
 
  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/org.musescore.MuseScore4portable.desktop" "${pkgdir}/usr/share/applications/org.musescore.MuseScore4portable.desktop"
  

}
