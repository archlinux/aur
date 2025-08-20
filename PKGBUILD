# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

# Inspired by the arnis PKGBUILD (https://aur.archlinux.org/packages/arnis)

_pkgname=arnis
pkgname=arnis-bin
pkgver=2.2.1
pkgrel=2
pkgdesc='Generate any location from the real world in Minecraft (binary version)'
arch=('x86_64')
url="https://github.com/louis-e/${_pkgname}"
license=('Apache-2.0')
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libsoup3' 'openssl' 'wayland' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-linux-v${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/${_pkgname}-linux"
        "README-v${pkgver}::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-512x-v${pkgver}.png::${url}/raw/v${pkgver}/icons/icon.png"
        "${_pkgname}-128x-v${pkgver}.png::${url}/raw/v${pkgver}/icons/128x128.png"
        "${_pkgname}.desktop")
sha256sums=('5b23a20a8b0a279fc3e325ea026ab367cc3ca8fdbfe86d8b3b1ed94dde38094b'
            'f7eeefefa7064ac9a05589fdf492f9baaae8337e2a0d48b7145db2fd1e314c31'
            '7bf44562b882ed7f6ca52ee7f67b80dd5eaef1301c0c1275ec2f7e571ce985b5'
            '860c74a299aac6f7645f62e127f21ae5df43fc8fb946cfa5bb96f90c54f0cdb3'
            '70eb77205fb1f39588a8296903919b05af7e77cfe2ab9c42849d81e7580fd231')

package() {
    install -Dm755 "${_pkgname}-linux-v${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README-v${pkgver}" "$pkgdir/usr/share/doc/${pkgname}/README.md"

    # Desktop integration files
    install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_pkgname}-512x-v${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${_pkgname}-128x-v${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
