pkgname=mihomo-purity-bin
_pkgname=mihomo-purity
pkgver=1.7.0
pkgrel=1
pkgdesc="A purer mihomo party fork"
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-purity/mihomo-purity"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-electron" "$_pkgname-electron-bin")
conflicts=("mihomo-purity-git" 'mihomo-purity')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs')
optdepends=('libappindicator-gtk3: Allow mihomo-purity to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
install=$_pkgname.install
source=("${_pkgname}.sh")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/mihomo-purity-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/mihomo-purity-linux-${pkgver}-arm64.deb")
sha256sums=('e390f9bbce3ae680ab9413f83c69e22c193b43a506439253bdf1e71a0050c938')
sha256sums_x86_64=('2bd08ea0d388cf1a65e7026361c3c2db6e10641bb8a8850f4bb03aa138884f20')
sha256sums_aarch64=('9c992c530d86b95ff90c90e3f9281b2e7e6bbc08375f4a628c6cf9715b573b2c')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/mihomo-purity/mihomo-purity
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo-alpha
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i '3s!/opt/mihomo-purity/mihomo-purity!mihomo-purity!' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
