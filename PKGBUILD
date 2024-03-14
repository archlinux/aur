# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=hiddify-next
pkgname=${_pkgname}-bin
pkgver=0.17.12
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH etc. It’s an open-source, secure and ad-free"
arch=(x86_64)
url='https://github.com/hiddify/hiddify-next'
license=('CC-BY-NC-SA-4.0')
depends=('hicolor-icon-theme' 'glibc' 'gcc-libs' 'glib2' 'libayatana-appindicator' 'libdbusmenu-glib' 'libayatana-indicator' 'ayatana-ido')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=('hiddify')
conflicts=(${_pkgname} ${_pkgname}-git)
source=(
    "$_pkgname-$pkgver.deb::https://github.com/hiddify/hiddify-next/releases/download/v${pkgver}/Hiddify-Debian-x64.deb"
)
sha256sums=(
    "e2507553ddde4df8cc2253f7f1d4f6715ff679141a97336576fe5784033820e9"
)
_install_path="/opt/$_pkgname"

prepare() {
    cd "${srcdir}"
    tar --zstd -xf data.tar.zst
    sed -i '/Version/d' "${srcdir}/usr/share/applications/hiddify.desktop"
}

package() {
    cd ${srcdir}/usr/share/hiddify
    find . -type f -exec install -Dm 755 {} "$pkgdir/$_install_path"/{} \;
    cd ${srcdir}/usr/share/icons
    find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/icons"/{} \;
    cd ${srcdir}/usr/share/applications
    find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/applications"/{} \;
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/hiddify" "${pkgdir}/usr/bin/hiddify"
}
