# Maintainer: Felitendo
# Contributor: Infrawrench LLC <astrid@infrawrench.com>
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=schist-bin
pkgver=0.15.0
pkgrel=1
# Upstream's own package release in the asset name, synced by pkg.sh. It only
# moves when upstream repackages a version that has already shipped.
_relver=1
pkgdesc="Layered image editor with PSD and Affinity support (upstream binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Infrawrench/schist"
license=('MIT')
# The same list as the source package, checked by pkg.sh against upstream's
# PKGBUILD. Upstream's own schist-bin makes vulkan-driver optional only to
# keep its build container from pulling in nvidia-utils.
depends=('fontconfig' 'freetype2' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon'
         'libxkbcommon-x11' 'vulkan-driver' 'vulkan-icd-loader' 'wayland')
optdepends=('libheif>=1.23.4: HEIC import')
provides=("schist=${pkgver}")
conflicts=('schist')
# upstream strips the debug info itself and keeps the build id for its crash
# reports
options=('!strip' '!debug')
# The release asset is a pacman package built by upstream's CI
# (packaging/linux/packages.sh). makepkg extracts it, only its usr/ is taken.
source_x86_64=("${url}/releases/download/v${pkgver}/schist-${pkgver}-${_relver}-x86_64.pkg.tar.zst")
source_aarch64=("${url}/releases/download/v${pkgver}/schist-${pkgver}-${_relver}-aarch64.pkg.tar.zst")
sha256sums_x86_64=('ef4501ecc8109e21d1813fdfc8d618090a9be5bb238545527614a1ff60d983c1')
sha256sums_aarch64=('11e12bd6bc0ee6fb6d27004809750c62a180d64c5eb274a2aac685fdabdeeff1')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/schist" "$pkgdir/usr/share/licenses/$pkgname"
}
