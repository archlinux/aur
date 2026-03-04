pkgname=koala-clash-bin
_pkgname=koala-clash
pkgver=1.0.2
pkgrel=1
pkgdesc="A geeked Mihomo client with features that improve the user experience."
arch=('x86_64' 'aarch64')
url="https://github.com/coolcoala/koala-clash"
license=('GPL3')
conflicts=("sparkle-git" "sparkle" "sparkle-bin" "sparkle-electron" "sparkle-electron-bin" "sparkle-electron-git" "$_pkgname" "$_pkgname-git" "$_pkgname-electron" "$_pkgname-electron-bin" "$_pkgname-electron-git")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Allow koala-clash to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
install=$_pkgname.install
source=("${_pkgname}.sh")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/koala-clash_amd64.deb") # rename to Koala.Clash later
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/koala-clash_arm64.deb")
sha256sums=('caade87cb247563180f7f8f9d32d8556552e8c1055b1cc6aea1ff10ffec36762')
sha256sums_x86_64=('b63b9abc85632a414fdbd561f13aae60dbfda6b30263e26a0a262b075bbe0cc3')
sha256sums_aarch64=('8cd7398b8fc1cd70d41e386af9995cbddc1043d9018391c29f056f1435712a10')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/koala.clash/koala-clash
    chmod +x ${pkgdir}/opt/koala-clash/resources/files/koala-clash-service
    chmod +sx ${pkgdir}/opt/koala-clash/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/koala-clash/resources/sidecar/mihomo-alpha
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i '3s!/opt/koala-clash/koala-clash!koala-clash!' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
