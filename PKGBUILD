pkgname=eshot-bin
pkgver=4.0.6
pkgrel=1
pkgdesc='Screenshot, annotation, OCR, GIF and video capture tool'
arch=('x86_64')
url='https://github.com/Benoks/EShot'
license=('MIT')
depends=('fuse2')
provides=('eshot')
conflicts=('eshot')
options=('!strip')

_appimage="EShot-v${pkgver}-x86_64.AppImage"
source=("${_appimage}::https://github.com/Benoks/EShot/releases/download/v${pkgver}/${_appimage}"
        'eshot')
sha256sums=('33698b8458307830569446e4f81636377c76f1df42370e7a83c5611bf04edc4b'
            'SKIP')

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}/${_appimage}" --appimage-extract >/dev/null
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/eshot/EShot.AppImage"
    install -Dm755 "${srcdir}/eshot" "${pkgdir}/usr/bin/eshot"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/io.github.benoks.EShot.desktop" \
        "${pkgdir}/usr/share/applications/io.github.benoks.EShot.desktop"
    sed -i 's|^Exec=.*|Exec=eshot|' \
        "${pkgdir}/usr/share/applications/io.github.benoks.EShot.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/io.github.benoks.EShot.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.benoks.EShot.svg"
}
