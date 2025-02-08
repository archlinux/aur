pkgname=mihomo-purity-electron-bin
_pkgname=mihomo-purity
pkgver=0.2.2
pkgrel=1
pkgdesc="A purer mihomo party fork"
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-purity/mihomo-purity"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-bin" "$_pkgname-electron")
depends=('electron' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs')
optdepends=('libappindicator-gtk3: Allow mihomo-purity to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('asar')
install=$_pkgname.install
source=("${_pkgname}.desktop" "${_pkgname}.sh")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/mihomo-purity-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/mihomo-purity-linux-${pkgver}-arm64.deb")
sha256sums=(
    "9fb03735d230efe35f79fdb94aea5ff1002c1dcb78ab38209b4b2764d17f3f4b"
    "973c19f294dea534035c299ffb46a45efe6def53f8f28510e7427628e821ac13"
)
sha256sums_x86_64=("2bd08ea0d388cf1a65e7026361c3c2db6e10641bb8a8850f4bb03aa138884f20")
sha256sums_aarch64=("9c992c530d86b95ff90c90e3f9281b2e7e6bbc08375f4a628c6cf9715b573b2c")
options=('!lto')

package() {
    bsdtar -xf data.tar.xz -C $srcdir
    asar extract $srcdir/opt/mihomo-purity/resources/app.asar ${pkgdir}/opt/mihomo-purity
    cp -r $srcdir/opt/mihomo-purity/resources/sidecar ${pkgdir}/opt/mihomo-purity/resources/
    cp -r $srcdir/opt/mihomo-purity/resources/files ${pkgdir}/opt/mihomo-purity/resources/
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo-alpha
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/mihomo-purity/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    chown -R root:root ${pkgdir}
}
