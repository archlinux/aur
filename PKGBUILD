# Maintainer: Aster1630 <support@aetherassembly.org>

# Repackages the official release .deb rather than building from source: Driftleaf's
# build needs an authenticated GitHub Packages token for a private npm dependency,
# which a clean makepkg chroot has no way to provide.
pkgname=driftleaf-bin
pkgver=0.8.2
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
sha256sums_x86_64=('1b49f26aa3120ee4ad53b5dddb79dd5d13488a85d32dfb6c8df2355f9129b925')
sha256sums_aarch64=('3b08348dd2193314219a446085a643e253dfdf363f1d06957a0661a8d6132a36')

package() {
  bsdtar -xOf "${srcdir}"/Driftleaf_*.deb data.tar.gz | bsdtar -xf - -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
