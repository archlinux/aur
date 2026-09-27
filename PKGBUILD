# Maintainer: kawaiiDango <kawaiiDango at protonmail dot com>
# Maintainer: Nick80835 <nick80835 at proton dot me>

_pkgname=pano-scrobbler
pkgname=pano-scrobbler-bin
_pkgver=446
pkgver=4.46
pkgrel=1
pkgdesc="Feature rich scrobbler. Supports Last.fm, ListenBrainz, Libre.fm & Pleroma. With regex edits, charts & Discord Rich Presence on PC."
arch=('x86_64' 'aarch64')
url="https://github.com/kawaiiDango/pano-scrobbler"
license=('GPL-3.0-or-later')
depends=('dbus' 'webkitgtk-6.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("pano-scrobbler-${_pkgver}-linux-x64.tar.zst::${url}/releases/download/${_pkgver}/pano-scrobbler-linux-x64.tar.zst")
source_aarch64=("pano-scrobbler-${_pkgver}-linux-arm64.tar.zst::${url}/releases/download/${_pkgver}/pano-scrobbler-linux-arm64.tar.zst")
sha256sums_x86_64=('eb5950c07be51679244b0bc76b3cabb2c260ec4e56aae673345e68212d97e852')
sha256sums_aarch64=('fe720544ddd3969d33ba026f7f745953f428e967a9bab33bda3e008dbccef6fc')

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
