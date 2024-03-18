# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=hiddify-next
pkgname=${_pkgname}-bin
pkgver=1.0.0
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
    "54a19777e27759b6c07c9ac63eac0394b2eee7feb7a72e1216c63eca34687e8e"
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
