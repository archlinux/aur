# Maintainer: Kitotsu Molina <kitotsumolina@users.noreply.github.com>
pkgname=kitsune-rendercore
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland live wallpaper renderer with per-monitor video mapping and hot reload"
arch=('x86_64')
url="https://github.com/KitotsuMolina/Kitsune-RenderCore"
license=('MIT')
depends=(
  'ffmpeg'
  'wayland'
  'libxkbcommon'
  'libdrm'
  'vulkan-icd-loader'
)
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "Kitsune-RenderCore-${pkgver}"
  cargo build --release --locked --features wayland-layer
}

package() {
  cd "Kitsune-RenderCore-${pkgver}"

  install -Dm755 "target/release/kitsune-rendercore" \
    "${pkgdir}/usr/bin/kitsune-rendercore"

  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "COMMAND.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/COMMAND.md"
  install -Dm755 "scripts/install-user-service.sh" \
    "${pkgdir}/usr/share/${pkgname}/install-user-service.sh"
  install -Dm755 "scripts/install-deps.sh" \
    "${pkgdir}/usr/share/${pkgname}/install-deps.sh"
  install -Dm755 "scripts/check-deps.sh" \
    "${pkgdir}/usr/share/${pkgname}/check-deps.sh"
  install -Dm644 "systemd/kitsune-rendercore.service" \
    "${pkgdir}/usr/share/${pkgname}/kitsune-rendercore.service"
  install -Dm644 "systemd/kitsune-rendercore.env.example" \
    "${pkgdir}/usr/share/${pkgname}/kitsune-rendercore.env.example"
}
