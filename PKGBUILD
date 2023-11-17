# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=singland
pkgname=${_pkgname}-bin
pkgver=pre_alpha_4
pkgrel=2
pkgdesc="A GUI for sing-box. The universal proxy platform"
arch=(x86_64)
url='https://github.com/net-breaker/sing-land'
license=('MIT')
depends=('hicolor-icon-theme' 'glib2' 'glibc' 'gcc-libs' 'expat' 'dbus')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=(${_pkgname})
conflicts=(${_pkgname}-git ${_pkgname})
source=(
    "https://github.com/net-breaker/sing-land/releases/download/${pkgver//_/-}/singland-alpha-linux-amd64.tar.gz"
    "singland.desktop"
    "https://raw.githubusercontent.com/net-breaker/sing-land/main/LICENSE"
)
sha256sums=(
    "fb09e9be944c7237d9311b23206dd0e2e88b36462db76188ee6737c47b995b9e"
    "bedcc8193fcadf9e33c4117bf47fa9e479abd2fc88548571323b26d9b4cbf77a"
    "98137f871b486ba3e608ca184e98c22adc6f928521e70dc3f6d21b234252927d"
)
_install_path="/opt/$_pkgname"

package() {
    cd "${srcdir}/singland"
    cd $(find . -type d -name 'singland-*' -print -quit)
    find . -type f -exec install -Dm755 {} "$pkgdir/$_install_path"/{} \;
    for _icons in 32 256 512;do
        install -Dm644 "./resources/icons/logo-${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/singland.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}