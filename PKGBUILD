# Maintainer: kristofferR <481270+kristofferR@users.noreply.github.com>
#
# Template for the AUR package. The `aur` job in .github/workflows/release.yml
# fills in the version and checksum placeholders and pushes the result (with a
# regenerated .SRCINFO) to the AUR on every release.
pkgname=chatpane
pkgver=3.1.0
pkgrel=1
pkgdesc="Distraction-free desktop client for Facebook Messenger"
arch=('x86_64' 'aarch64')
url="https://chatpane.app/"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
# Replaces the package from before the rename.
provides=('carrier')
conflicts=('carrier')
replaces=('carrier')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/kristofferR/Chatpane/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/kristofferR/Chatpane/releases/download/v${pkgver}/Chatpane_${pkgver}_lin_x64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/kristofferR/Chatpane/releases/download/v${pkgver}/Chatpane_${pkgver}_lin_arm.deb")
sha256sums=('957e3579dea42e66b0d3cdea831c3b93edaaa8a3566e4115efd11959f60c0d9d')
sha256sums_x86_64=('b8fef9f0bf7e5f299b6d207f713314d20c28e2a782ac02203d91454a63d159a3')
sha256sums_aarch64=('76c71953dbf14116d273c8299b8e2846fb47e61b0d80480108d98d880ad1850e')

package() {
    # makepkg already extracted the .deb into srcdir; unpack its payload.
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
