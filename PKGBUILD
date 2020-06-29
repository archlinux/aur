# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=wonderpen-appimage
_pkgname="WonderPen_linux_1.7.9(5225).AppImage"
pkgver=1.7.9
pkgrel=1
pkgdesc="A professional writing software with markdown support"
arch=("x86_64")
url="https://www.atominn.com/wonderpen"
license=(custom)
noextract=(${_pkgname})
options=("!strip")
source=("https://file.atominn.com/WonderPen/1.7/WonderPen_linux_1.7.9(5225).AppImage"
        "wonderpen.sh")
sha256sums=('a20905cb3e469e728c0fa985e724c62c7bbe0c21bdf8eb220521000381d29e87'
            '67e1c7313c3724e94d249054626ff1b58e67adad15ccbea5a9a4e67f501dd725')

prepare() {
    cd "${srcdir}"
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
}

package() {
    cd ${srcdir}
    install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/opt/appimage/wonderpen/wonderpen.AppImage"
    install -Dm755 "${srcdir}/wonderpen.sh" "${pkgdir}/usr/bin/wonderpen"
    install -Dm644 "${srcdir}/squashfs-root/wonderpen.desktop" "${pkgdir}/usr/share/applications/wonderpen.desktop"
    install -Dm644 "${srcdir}/squashfs-root/wonderpen.png" "${pkgdir}/usr/share/icons/wonderpen.png"
    sed -i 's|Exec=AppRun|Exec=wonderpen %F|g' "${pkgdir}/usr/share/applications/wonderpen.desktop"
} 
