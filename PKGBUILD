# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Contributor: Shaurya Shubham <me@shauryashubham.com>

pkgname=popsicle-bin
pkgver=1.3.3
pkgrel=2
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
arch=('x86_64')
url="https://github.com/pop-os/popsicle"
license=('MIT')
options=('!strip')
provides=(popsicle)
conflicts=(popsicle)
_filename="Popsicle_USB_Flasher-$pkgver-x86_64.AppImage"
source=("https://github.com/pop-os/popsicle/releases/download/$pkgver/$_filename")
sha256sums=('fb975b0362032213564531c0bfb5f2b064825b9fa58c89d6b8ebd75dfcb2db50')

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
