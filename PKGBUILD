# Maintainer: Aster1630 <support@aetherassembly.org>

# Repackages the official release .deb rather than building from source: Driftleaf's
# build needs an authenticated GitHub Packages token for a private npm dependency,
# which a clean makepkg chroot has no way to provide.
pkgname=driftleaf-bin
pkgver=0.8.1
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
sha256sums_x86_64=('a7cd986e937f149b31e5277e040003da23f91fdfd70fc9bf82b94e30558dd5d5')
sha256sums_aarch64=('97899b6d38a56170a3e67c20749a2bf8fa899798c468aa1b14d56d9097c6e0bb')

package() {
  bsdtar -xOf "${srcdir}"/Driftleaf_*.deb data.tar.gz | bsdtar -xf - -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
