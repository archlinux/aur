pkgname=mihomo-party-bin
_pkgname=mihomo-party
pkgver=0.2.2
pkgrel=1
pkgdesc="Another Mihomo GUI."
arch=('x86_64' 'aarch64')
url="https://github.com/pompurin404/mihomo-party"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-electron" "$_pkgname-electron-bin")
conflicts=("mihomo-party-git" 'mihomo-party')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Allow mihomo-party to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('nodejs' 'pnpm' 'jq' 'libxcrypt-compat')
install=$_pkgname.install
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-arm64.deb")
sha256sums_x86_64=("ec0e60e652fff0c5f64ab5167b4d417b0826a87afa1df07a63c6959a258b1ad5")
sha256sums_aarch64=("d5e26b8343d95566ac24d3ae6536571c326c0d07f9cc92d851eb589d00a525e7")

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/mihomo-party/mihomo-party
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo
    chmod +x ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo-alpha
    cd ${pkgdir}/../..
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	sed -i '3s!/opt/mihomo-party/mihomo-party!mihomo-party!' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    chown -R root:root ${pkgdir}
}