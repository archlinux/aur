# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

# Inspired by the arnis PKGBUILD (https://aur.archlinux.org/packages/arnis)

_pkgname=arnis
pkgname=arnis-bin
pkgver=2.3.1
pkgrel=1
pkgdesc='Generate any location from the real world in Minecraft (binary version)'
arch=('x86_64')
url="https://github.com/louis-e/${_pkgname}"
license=('Apache-2.0')
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libsoup3' 'openssl' 'wayland' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-linux-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux"
        "README-v${pkgver}::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-512x-v${pkgver}.png::${url}/raw/v${pkgver}/assets/icons/icon.png"
        "${_pkgname}-128x-v${pkgver}.png::${url}/raw/v${pkgver}/assets/icons/128x128.png"
        "${_pkgname}.desktop")
sha256sums=('f8bb1856585d7a7305b6d76ce750f79de92c08845130284d94ed7bc83aa2c603'
            'd33582c2c2e7cf7887171c093a1078a2fb2dc5928a6c8b698af72c5dcebe112c'
            '04e4f85dbd53dc824e93811b05a2fe567f53c66df5f473bc4b0b0fa16970b483'
            '2bb9a2312ff258bc762d435840c12daf2bdc5c95e0c179d2356b17dd9536de5b'
            '70eb77205fb1f39588a8296903919b05af7e77cfe2ab9c42849d81e7580fd231')

package() {
    install -Dm755 "${_pkgname}-linux-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README-v${pkgver}" "$pkgdir/usr/share/doc/${pkgname}/README.md"

    # Desktop integration files
    install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_pkgname}-512x-v${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${_pkgname}-128x-v${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
