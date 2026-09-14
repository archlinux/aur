# Maintainer: kawaiiDango <kawaiiDango at protonmail dot com>
# Maintainer: Nick80835 <nick80835 at proton dot me>

_pkgname=pano-scrobbler
pkgname=pano-scrobbler-bin
_pkgver=444
pkgver=4.44
pkgrel=1
pkgdesc="Feature rich scrobbler. Supports Last.fm, ListenBrainz, Libre.fm & Pleroma. With regex edits, charts & Discord Rich Presence on PC."
arch=('x86_64' 'aarch64')
url="https://github.com/kawaiiDango/pano-scrobbler"
license=('GPL-3.0-or-later')
depends=('dbus' 'webkitgtk-6.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("pano-scrobbler-${_pkgver}-linux-x64.tar.gz::${url}/releases/download/${_pkgver}/pano-scrobbler-linux-x64.tar.gz")
source_aarch64=("pano-scrobbler-${_pkgver}-linux-arm64.tar.gz::${url}/releases/download/${_pkgver}/pano-scrobbler-linux-arm64.tar.gz")
sha256sums_x86_64=('166b5a5370c4ef82448f1e598e499cd37fc50ee6c6f98a6a92ac85c77c5e13ec')
sha256sums_aarch64=('9002ece8991460b0603e4df3a60652ea780df5af88c5c685ea68a3130030627d')

package() {
    # Main executable
    install -Dm755 -t "${pkgdir}/opt/${_pkgname}/" "${_pkgname}"

    # Shared libs
    install -Dm644 -t "${pkgdir}/opt/${_pkgname}" ./*.so
    install -Dm644 -t "${pkgdir}/opt/${_pkgname}/lib" lib/*.so

    # Symlink main executable
    install -d "${pkgdir}/usr/bin"
    ln -srf "${pkgdir}/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # .desktop, icon, license
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${_pkgname}.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/" icons/hicolor/scalable/apps/*.svg
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/" icons/hicolor/symbolic/apps/*.svg
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
}
