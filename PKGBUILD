pkgname=mihomo-party-electron-bin
_pkgname=mihomo-party
pkgver=1.8.8
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
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-party-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-party-linux-${pkgver}-arm64.deb")
sha256sums=(
    "96a6250f67517493f839f964c024434dbcf784b25a73f074bb505f1521f52844"
    "87fddbcd4a4cc7bda22ec4cadff0040e54395bb13184ee4688b58788c1fa7180"
)
sha256sums_x86_64=("0a28cba37c8b42c1ccb5e8c8bd1938d6459dbfa56867139e1ca6b0c2a7c6ea07")
sha256sums_aarch64=("7ba8386a09970c4f6af06707e7d79ece9113e006e10f3595a00b75ab019bd2d7")
options=('!lto')

package() {
    bsdtar -xf data.tar.xz -C $srcdir
    asar extract $srcdir/opt/clash-party/resources/app.asar ${pkgdir}/opt/mihomo-party
    cp -r $srcdir/opt/clash-party/resources/sidecar ${pkgdir}/opt/mihomo-party/resources/
    cp -r $srcdir/opt/clash-party/resources/files ${pkgdir}/opt/mihomo-party/resources/
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo-alpha
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo-smart
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/clash-party/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    chown -R root:root ${pkgdir}
}
