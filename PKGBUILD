# Maintainer: Shaurya Shubham <me@shauryashubham.com>

pkgname=popsicle-bin
_pkgname=popsicle
pkgver=1.3.0
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
arch=('x86_64')
url="https://github.com/pop-os/popsicle"
license=('MIT')
options=('!strip')
_filename="Popsicle_USB_Flasher-$pkgver-x86_64.AppImage"
source=("https://github.com/pop-os/popsicle/releases/download/1.3.0/$_filename")

prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
    ${_filename} --appimage-extract
    rm ${srcdir}/squashfs-root/usr/share/icons/hicolor/icon-theme.cache
}

package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/applications" "${pkgdir}/usr/share/"
}
