# Maintainer: Kyle Jackson <your@email.com>
# paintfe-bin — installs the prebuilt Linux binary from the GitHub release.
# Faster to install than paintfe (no Rust compile). x86_64 only.
# Update pkgver + sha256sums for each new release.
# Portable archive sha256 is in checksums-SHA256.txt attached to each GitHub release.

pkgname=paintfe-bin
pkgver=1.3.2
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
    "PaintFE-linux-x64-${pkgver}.tar.gz::https://github.com/kylejckson/PaintFE/releases/download/v${pkgver}/PaintFE-linux-x64.tar.gz"
    "PaintFE-${pkgver}.desktop::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/packaging/appimage/PaintFE.AppDir/PaintFE.desktop"
    "PaintFE-${pkgver}.png::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/assets/icons/app_icon.png"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/kylejckson/PaintFE/v${pkgver}/LICENSE.md"
)
sha256sums=('ba73ebf4c2a09252a03966e169f33eebca85b12d82170c9945afaa8e0994a4b9'
            'cc0764b5e156e1c7af4ca70d1cadec0c47368e51ae480324eee2f448db58e4d4'
            '01d846f2682ae7fb3a67542ef4e2b31212a6286b6da3964d18e0591c72e3fcc5'
            '93a341aa77d861fdf5fcf20243c40a13da5bf7ab1d2058e9d67b8777534a5c0e')

package() {
    install -Dm755 "PaintFE-linux-x64/PaintFE"      "$pkgdir/usr/bin/PaintFE"
    install -d "$pkgdir/usr/lib/paintfe/paintdotnet-host"
    cp -a PaintFE-linux-x64/paintdotnet-host/. "$pkgdir/usr/lib/paintfe/paintdotnet-host/"
    ln -s /usr/lib/paintfe/paintdotnet-host "$pkgdir/usr/bin/paintdotnet-host"
    install -Dm644 "PaintFE-${pkgver}.desktop"      "$pkgdir/usr/share/applications/PaintFE.desktop"
    install -Dm644 "PaintFE-${pkgver}.png"          "$pkgdir/usr/share/icons/hicolor/256x256/apps/PaintFE.png"
    install -Dm644 "LICENSE-${pkgver}.md"           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
