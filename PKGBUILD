# Maintainer ArjixWasTaken <me@arjix.dev>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2155,SC2164

_name=cutter
pkgname=$_name-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Free and Open Source Reverse Engineering Platform powered by rizin"
url="https://github.com/rizinorg/cutter/"
arch=('x86_64')
license=('GPL3')
provides=("$_name" "rz-cutter")
conflicts=("$_name" "rz-cutter")

source=(
    "Cutter.AppImage::https://github.com/rizinorg/cutter/releases/download/v${pkgver}/Cutter-v${pkgver}-Linux-x86_64.AppImage"
    "cutter.sh"
)
sha512sums=('c5890b9c78bb853f4b3ad500beec1645c9c7071e68c0fc915a5b429fffbc66dfffa522913d8a9662963c659f23a55ee349ad690e05a6f644ad90f93a51f3911e'
            'ef79b7f1f558ea0afe06b1b2d69afaee03e11c1dd4059224f208177781c909a7493ff0767a37d96ded8dd38052076d4324d4711e7560ae24c74aee874db09e24')

prepare() {
    chmod +x Cutter.AppImage
    ./Cutter.AppImage --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/usr/lib/${_name}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${_name}/"

    install -Dm755 "${srcdir}/cutter.sh" "${pkgdir}/usr/bin/${_name}"

    install -Dm644 "${srcdir}/squashfs-root/re.rizin.cutter.desktop" \
                   "${pkgdir}/usr/share/applications/re.rizin.cutter.desktop"

    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/re.rizin.cutter.appdata.xml" \
                   "${pkgdir}/usr/share/metainfo/re.rizin.cutter.appdata.xml"
    
    cp -a "${srcdir}/squashfs-root/usr/share/icons" \
          "${pkgdir}/usr/share/"
}
