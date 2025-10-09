# Maintainer: Daragh M. Hollman <daragh.hollman@dias.ie>

_pkgname=sciqlop

pkgname="${_pkgname}"-appimage
pkgver=0.10.0
pkgrel=1
pkgdesc="An ergonomic and efficient application to browse and label in situ plasma measurements from multi-mission satellite data"
arch=("x86_64")
url="https://github.com/SciQLop/SciQLop"
license=("GPL3")
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/SciQLop/SciQLop/releases/download/v${pkgver}/SciQLop-x86_64-v${pkgver}.AppImage")
sha256sums=("83376006cee9c8dc3fa131b1769a18c6f64bca6eb6885abdd66c4db450b7d7fa")

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # Create desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Name=SciQLop
Exec=/opt/${pkgname}/${_pkgname}.AppImage %U
Type=Application
Comment=${pkgdesc}
EOF

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
