# Maintainer: Aster1630 <support@aetherassembly.org>

# Repackages the official release .deb rather than building from source: Driftleaf's
# build needs an authenticated GitHub Packages token for a private npm dependency,
# which a clean makepkg chroot has no way to provide.
pkgname=driftleaf-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A local-first encrypted notes, graph, and database app"
arch=('x86_64' 'aarch64')
url="https://github.com/AetherAssembly/Driftleaf"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'hicolor-icon-theme')
provides=('driftleaf')
conflicts=('driftleaf')
source_x86_64=("https://github.com/AetherAssembly/Driftleaf/releases/download/v${pkgver}/Driftleaf_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/AetherAssembly/Driftleaf/releases/download/v${pkgver}/Driftleaf_${pkgver}_arm64.deb")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/AetherAssembly/Driftleaf/v${pkgver}/LICENSE")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('0e86c784333d7ae42cab753ac046b089ecc5e7bee6e52589814efb2e0f61ae63')
sha256sums_aarch64=('87db6a78d8cbce2c96d38c7265b715a70215cd1d2a8f2b5e38938b81c39844e7')

package() {
  bsdtar -xOf "${srcdir}"/Driftleaf_*.deb data.tar.gz | bsdtar -xf - -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
