# Maintainer: Shaurya Shubham <me@shauryashubham.com>

pkgname=popsicle-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
arch=('x86_64')
url="https://github.com/pop-os/popsicle"
license=('MIT')
options=('!strip')
_filename="Popsicle_USB_Flasher-$pkgver-x86_64.AppImage"
source=("https://github.com/pop-os/popsicle/releases/download/$pkgver/$_filename")
sha256sums=('e7de1da4a02d9ac8ae101e3843a033b12494fbce72051f4548cf834c77c78a3e')

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
