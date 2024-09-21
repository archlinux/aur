pkgname=mihomo-party-electron-bin
_pkgname=mihomo-party
pkgver=1.2.24
pkgrel=1
pkgdesc="Another Mihomo GUI."
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-party-org/mihomo-party"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-bin" "$_pkgname-electron")
depends=('electron' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Allow mihomo-party to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('asar')
install=$_pkgname.install
source=("${_pkgname}.desktop" "${_pkgname}.sh")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-arm64.deb")
sha256sums=(
    "96a6250f67517493f839f964c024434dbcf784b25a73f074bb505f1521f52844"
    "560733f0e5bd9b47ff50c849301c8a22ae17a5df26830d8c97033dfcbd392382"
)
sha256sums_x86_64=("3409a29c97d5abb0b5fb5f1e01d4b74c6cbc7dace5625092908b0828d8a8a046")
sha256sums_aarch64=("32790a5e39d9b7e69c7773ea18750bdd42bec918d9837e3d3f3fef7e72cbd095")
options=('!lto')

package() {
    bsdtar -xf data.tar.xz -C $srcdir
    asar extract $srcdir/opt/mihomo-party/resources/app.asar ${pkgdir}/opt/mihomo-party
    cp -r $srcdir/opt/mihomo-party/resources/sidecar ${pkgdir}/opt/mihomo-party/resources/
    cp -r $srcdir/opt/mihomo-party/resources/files ${pkgdir}/opt/mihomo-party/resources/
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo-alpha
    cd ${pkgdir}/../..
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/mihomo-party/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    chown -R root:root ${pkgdir}
}