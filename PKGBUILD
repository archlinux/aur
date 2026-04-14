# Maintainer: Daragh M. Hollman <daragh.hollman@dias.ie>

_pkgname=sciqlop

pkgname="${_pkgname}"-appimage
pkgver=0.11.3
pkgrel=1
pkgdesc="An ergonomic and efficient application to browse and label in situ plasma measurements from multi-mission satellite data"
arch=("x86_64")
url="https://github.com/SciQLop/SciQLop"
license=("GPL3")
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/SciQLop/SciQLop/releases/download/v${pkgver}/SciQLop-x86_64-v${pkgver}.AppImage")
sha256sums=('5f396e5b2492f040dc9ac1eccf6991f2873be6a32f4bf4c490f6f9461d85e02b')

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
