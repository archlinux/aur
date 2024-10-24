pkgname=mihomo-party-electron-bin
_pkgname=mihomo-party
pkgver=1.5.5
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
sha256sums_x86_64=("7a50aa7e683bc668f9b52ca064e554884ca1eb14b369a7fbe0bbbd7e9441de89")
sha256sums_aarch64=("a77d22e6d966d592d013ff627b9bd243c8c00f4c0fecbed84624f025ba3019c0")
options=('!lto')

package() {
    bsdtar -xf data.tar.xz -C $srcdir
    asar extract $srcdir/opt/mihomo-party/resources/app.asar ${pkgdir}/opt/mihomo-party
    cp -r $srcdir/opt/mihomo-party/resources/sidecar ${pkgdir}/opt/mihomo-party/resources/
    cp -r $srcdir/opt/mihomo-party/resources/files ${pkgdir}/opt/mihomo-party/resources/
    chmod +sx ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo-alpha
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/mihomo-party/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    chown -R root:root ${pkgdir}
}
