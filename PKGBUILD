# Maintainer: kristofferR <481270+kristofferR@users.noreply.github.com>
#
# Template for the AUR package. The `aur` job in .github/workflows/release.yml
# fills in the version and checksum placeholders and pushes the result (with a
# regenerated .SRCINFO) to the AUR on every release.
pkgname=carrier
pkgver=2.0.4
pkgrel=1
pkgdesc="Distraction-free desktop client for Facebook Messenger"
arch=('x86_64' 'aarch64')
url="https://github.com/kristofferR/Carrier"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/kristofferR/Carrier/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/kristofferR/Carrier/releases/download/v${pkgver}/Carrier_${pkgver}_lin_x64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/kristofferR/Carrier/releases/download/v${pkgver}/Carrier_${pkgver}_lin_arm.deb")
sha256sums=('957e3579dea42e66b0d3cdea831c3b93edaaa8a3566e4115efd11959f60c0d9d')
sha256sums_x86_64=('4cc69fc37a47abe29c3972e99380d15bf47f78f363054904ea59a6f6f22542dc')
sha256sums_aarch64=('40b9381f886133ffe217b10ac319b5fbc7f3ec605238763101835389e361bfe4')

package() {
    # makepkg already extracted the .deb into srcdir; unpack its payload.
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
