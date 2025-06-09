# Maintainer: Aryan <aryangh1379 at gmail>

_pkgname=hiddify-app
pkgname=${_pkgname}-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH, Shadowsocks2022 etc. It’s an open-source, secure and ad-free. Localized for censored countries with good community support."
arch=(x86_64)
url='https://github.com/hiddify/hiddify-app'
license=('CC-BY-NC-SA-4.0')
depends=('hicolor-icon-theme'
'libayatana-appindicator'
'at-spi2-core'
'fontconfig'
'pango'
'gtk3'
'glibc'
'gcc-libs'
'ayatana-ido'
'gdk-pixbuf2'
'libayatana-indicator'
'libdbusmenu-glib'
'cairo'
'harfbuzz'
'glib2'
'libepoxy'
)
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=('hiddify')
conflicts=(${_pkgname} ${_pkgname}-git ${_pkgname}-appimage)
source=(
    "$_pkgname-$pkgver.deb::https://github.com/hiddify/hiddify-app/releases/download/v${pkgver}/Hiddify-Debian-x64.deb"
)
sha256sums=('746bc7acfea2f41f69d979c8dee99c8491747a2ef1907f5a4271d17088441cb3')
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
