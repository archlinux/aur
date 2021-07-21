# Maintainer: Shaurya Shubham <me@shauryashubham.com>

pkgname=popsicle-bin
pkgver=1.3.0
pkgrel=2
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
arch=('x86_64')
url="https://github.com/pop-os/popsicle"
license=('MIT')
options=('!strip')
_filename="Popsicle_USB_Flasher-$pkgver-x86_64.AppImage"
source=("https://github.com/pop-os/popsicle/releases/download/1.3.0/$_filename")
sha256sums=('98b5cca941e4370d4f03fa1f9fbf3442d6c4eee256e8b327661d02e870093bfe')

prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
    ./${_filename} --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}.AppImage"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/appimages/${_filename}.AppImage" "${pkgdir}/usr/bin/popsicle-gtk"

    install -dm755 "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/applications" "${pkgdir}/usr/share/"
}
