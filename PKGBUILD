pkgname=kitsune-livewallpaper
pkgver=0.2.1
pkgrel=1
pkgdesc="Kitsune live wallpaper engine runtime for Wayland/Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/KitotsuMolina/kitsune-livewallpaper"
license=('MIT')
depends=('ffmpeg' 'mpvpaper' 'libpulse' 'pipewire-pulse' 'procps-ng' 'pciutils' 'systemd')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "scripts/install-deps.sh" "${pkgdir}/usr/share/${pkgname}/install-deps.sh"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
