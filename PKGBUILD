# Maintainer ArjixWasTaken <me@arjix.dev>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2155,SC2164

_name=cutter
pkgname=$_name-bin
pkgver=2.4.1
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
sha512sums=(
    '19b32703355a199861fb92ea3fac48fb899172e0dd6dab83a8389899dcd33d8023bb616edbfcd3292818e1e97054240b60801a7677032404da3414e7b7b506ae'
    'ef79b7f1f558ea0afe06b1b2d69afaee03e11c1dd4059224f208177781c909a7493ff0767a37d96ded8dd38052076d4324d4711e7560ae24c74aee874db09e24'
)

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
