# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>

pkgname=webcatalog-bin
pkgver=42.2.0
pkgrel=1
pkgdesc="Turn Any Websites into Real Desktop Apps"
arch=('x86_64')
url="https://webcatalog.io/webcatalog/"
options=('!strip')
_filename="WebCatalog-$pkgver.AppImage"
source=("https://cdn-2.webcatalog.io/webcatalog/$_filename")
sha256sums=('5abf0ae99fa5ceacf40d080e2112479ace763331eba3d648fad633ff55a8c765')

prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
    ./${_filename} --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}.AppImage"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/appimages/${_filename}.AppImage" "${pkgdir}/usr/bin/webcatalog"

    install -dm755 "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
