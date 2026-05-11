# Maintainer: Kyle Jackson <your@email.com>
# paintfe-bin — installs the prebuilt Linux binary from the GitHub release.
# Faster to install than paintfe (no Rust compile). x86_64 only.
# Update pkgver + sha256sums for each new release.
# Binary sha256 is in checksums-SHA256.txt attached to each GitHub release.

pkgname=paintfe-bin
pkgver=1.2.15
pkgrel=1
pkgdesc="Fast, GPU-accelerated raster image editor (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kylejckson/PaintFE"
license=('MIT')
provides=('paintfe')
conflicts=('paintfe')
depends=(
    'gcc-libs'
    'glibc'
    'libxkbcommon'
    'wayland'
    'libx11'
)
optdepends=(
    'vulkan-icd-loader: hardware-accelerated GPU rendering (recommended)'
    'mesa: software/OpenGL fallback rendering'
)
source=(
    "PaintFE-bin-${pkgver}::https://github.com/kylejckson/PaintFE/releases/download/v${pkgver}/PaintFE"
    "PaintFE-${pkgver}.desktop::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/packaging/appimage/PaintFE.AppDir/PaintFE.desktop"
    "PaintFE-${pkgver}.png::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/assets/icons/app_icon.png"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/LICENSE.md"
)
sha256sums=('a9efbce8039d78168f856ee899d8a6d9dd1a5789a4dd5ae6a1fe31a3a85f2d13'
            '5025ed2b4f8403fd502b50baebe50f16b8e8c5b2b20569ce29dc25287ba4c072'
            '01d846f2682ae7fb3a67542ef4e2b31212a6286b6da3964d18e0591c72e3fcc5'
            '93a341aa77d861fdf5fcf20243c40a13da5bf7ab1d2058e9d67b8777534a5c0e')

package() {
    install -Dm755 "PaintFE-bin-${pkgver}"          "$pkgdir/usr/bin/PaintFE"
    install -Dm644 "PaintFE-${pkgver}.desktop"      "$pkgdir/usr/share/applications/PaintFE.desktop"
    install -Dm644 "PaintFE-${pkgver}.png"          "$pkgdir/usr/share/icons/hicolor/256x256/apps/PaintFE.png"
    install -Dm644 "LICENSE-${pkgver}.md"           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
