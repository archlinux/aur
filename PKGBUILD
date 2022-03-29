# Maintainer: Star <hengxings783@gmail.com>

pkgname=pikapika-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="A cross platform comic client."
arch=("x86_64")
url="https://github.com/niuhuan/pikapika"
license=("MIT")
_pkgname="pikapika-v${pkgver}-linux-${arch}.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=("pikapika")
conflicts=("pikapika")
source=("https://github.com/niuhuan/pikapika/releases/download/v${pkgver}/${_pkgname}")

_installPath=/opt/appimages/pikapika.AppImage

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+^Exec=+&${_installPath} --no-sandbox+" "squashfs-root/pikapika.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installPath}"
    install -Dm644 "squashfs-root/pikapika.desktop" "${pkgdir}/usr/share/applications/pikapika.desktop"
    cp -r "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
sha256sums=('8bc1b4390e6a0be30a0f6f10df24a901822bc0032da61b9e757743ba4ef9c636')
