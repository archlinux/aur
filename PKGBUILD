# Maintaoner: Yamada Hayao <development@fascode.net>

pkgname=slapdash
pkgver="1.8.1"
pkgrel=1
pkgdesc="a tool that can manage various web services for free in one place"
arch=('x86_64')
url="https://slapdash.com/"
license=('custom')
depends=()
makedepends=()
source=(
    "slapdash.AppImage::https://slapdash.com/download/linux"
    "slapdash.svg"
    "slapdash.desktop"
)
md5sums=(
    # sladash.AppImage
    'SKIP'

    # slapdash.svg
    "cf5766dd1f919a9d0f27de208b90bef3"

    # slapdash.desktop
    "3fd5cc784a22af15d83a3ad1af1b1c8f"
)

build(){
    chmod 755 "${srcdir}/slapdash.AppImage"
    "${srcdir}/slapdash.AppImage" --appimage-extract
}

package() {
    mkdir -p "${pkgdir}/opt/slapdash/" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/slapdash/"
    ln -s "${pkgdir}/opt/slapdash/AppRun" "${pkgdir}/usr/bin/slapdash"
    install -m 755 -D "${srcdir}/slapdash.svg" "${pkgdir}/usr/share/pixmaps/slapdash.svg"
    install -m 755 -D "${srcdir}/slapdash.desktop" "${pkgdir}/usr/share/applications/slapdash.desktop"
}
