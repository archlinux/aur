pkgname=kitsune-livewallpaper
pkgver=0.2.0
pkgrel=1
pkgdesc="Kitsune live wallpaper engine runtime for Wayland/Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/KitotsuMolina/kitsune-livewallpaper"
license=('MIT')
depends=('ffmpeg' 'mpvpaper' 'pulseaudio-utils' 'pipewire-pulse' 'procps-ng' 'pciutils' 'systemd')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('86be7a9c2de8f6c12daea39515b437e811d30743485ef27741adeaba9e34e891')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
