#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('storyboarder-appimage')
pkgver=2.0.1
pkgrel=1
pkgdesc="The best way to visualize your story. It makes it easy to visualize a story as fast you can draw stick figures."
provides=("storyboarder")
depends=('zlib' 'hicolor-icon-theme')
url='https://wonderunit.com/storyboarder/'
arch=('x86_64')
source=("https://github.com/wonderunit/storyboarder/releases/download/v2.0.1/Storyboarder-2.0.1-linux-x86_64.AppImage"
)
md5sums=('66afa5dc04d7d029e5ba5276f6de2797'
)
license=()
options=(!strip)
_filename="Storyboarder-2.0.1-linux-x86_64.AppImage"

prepare(){
     cd "${srcdir}"
     
     chmod +x "${_filename}"
     ./"${_filename}"  --appimage-extract
     
     sed -i "s|Exec=AppRun|Exec=/usr/bin/storyboarder|" "squashfs-root/storyboarder.desktop"
    
     chmod -R a-x+rX squashfs-root/usr
     
}
package(){
     # Appimage
     install -Dm755 "${srcdir}/${_filename}" "${pkgdir}"/opt/storyboarder/"${_filename}"
     
     # Desktop
     install -Dm644 "${srcdir}"/squashfs-root/storyboarder.desktop "${pkgdir}"/usr/share/applications/storyboarder.desktop
     
     # Icons
     install -dm755 "${pkgdir}"/usr/share
     cp -ar "${srcdir}"/squashfs-root/usr/share/icons "${pkgdir}"/usr/share/
     
     # ln
     mkdir -p "${pkgdir}"/usr/bin
     ln -s /opt/storyboarder/"${_filename}" "${pkgdir}"/usr/bin/storyboarder
}
