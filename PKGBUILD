# Maintainer: kristofferR <481270+kristofferR@users.noreply.github.com>
#
# Template for the AUR package. The `aur` job in .github/workflows/release.yml
# fills in the version and checksum placeholders and pushes the result (with a
# regenerated .SRCINFO) to the AUR on every release.
pkgname=carrier
pkgver=1.10.2
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
sha256sums_x86_64=('0eaa483e8e442033d81326d91711f267086972f1a3a7af0ca79e0cb5ed514a35')
sha256sums_aarch64=('c13ab98d8e6a3457fb3aee31e8d860df82e39c8b51a1da2093eeb2a005b19953')

package() {
    # makepkg already extracted the .deb into srcdir; unpack its payload.
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
