pkgname=mihomo-party-electron-bin
_pkgname=mihomo-party
pkgver=0.3.2
pkgrel=1
pkgdesc="Another Mihomo GUI."
arch=('x86_64' 'aarch64')
url="https://github.com/pompurin404/mihomo-party"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-bin" "$_pkgname-electron")
depends=('electron' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Allow mihomo-party to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('asar')
install=$_pkgname.install
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-arm64.deb")
sha256sums_x86_64=("67a70c06f2b3eb9a2a632a64830ea33992ac9065be998a0a6ab1158c037c1d4f")
sha256sums_aarch64=("42f9c62d5d11b7d5b2bdfa68c75a98a375506891704c35685a9c9807dadb0c8a")
options=('!lto')

package() {
    bsdtar -xf data.tar.xz -C $srcdir
    asar extract $srcdir/opt/mihomo-party/resources/app.asar ${pkgdir}/opt/mihomo-party
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo-alpha
    cd ${pkgdir}/../..
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "$srcdir/opt/mihomo-party/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    chown -R root:root ${pkgdir}
}