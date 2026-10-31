pkgname=openomsi-bin
pkgver=0.3.45
pkgrel=1
pkgdesc="OMSI 2 recreated from scratch in Rust, compatible with every map and mod; pre-built upstream binary"
arch=('x86_64' 'aarch64')
url="https://openomsi.org/"
license=('AGPL-3.0-only')
provides=('openomsi')
conflicts=('openomsi')
depends=(
  'glibc'
  'gcc-libs'
  'alsa-lib'
  'systemd-libs'
  'cairo'
  'dbus'
  'glib2'
  'gtk3'
  'gdk-pixbuf2'
  'webkit2gtk-4.1'
  'libsoup3'
  'wayland'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxkbcommon'
  'libxkbcommon-x11'
)
optdepends=(
  'vulkan-icd-loader: Vulkan renderer'
  'vulkan-radeon: Vulkan driver for AMD GPUs'
  'vulkan-intel: Vulkan driver for Intel GPUs'
  'vulkan-nouveau: Vulkan driver for NVIDIA GPUs (NVK)'
  'nvidia-utils: Vulkan driver for NVIDIA GPUs'
  'cloudflared: LAN tunnel for multiplayer sessions'
  'zenity: error dialogs'
  'kdialog: error dialogs on Plasma'
)
_baseurl=https://github.com/openOMSI-org/openOMSI/releases/download/v${pkgver}
source=('LICENSE')
source_x86_64=("openOMSI-${pkgver}-linux-x64.zip::${_baseurl}/openOMSI-${pkgver}-linux-x64.zip")
source_aarch64=("openOMSI-${pkgver}-linux-arm64.zip::${_baseurl}/openOMSI-${pkgver}-linux-arm64.zip")
sha256sums=('4cfc1a0e645c6506a80022ac1423d598e0a4a27d62ebd3d8d96b518278b74525')
sha256sums_x86_64=('ca1d6c18324017f4658dbad2db158c808ca4b2e0844ac806f09db1b59ce0d308')
sha256sums_aarch64=('4dd49dc60aa753d9ce20b1917ce0a3101bc726d3bab536c9072a96683790629d')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/lib/openomsi"
  install -m0755 openomsi openomsi-launcher openomsi-launcher-app "$pkgdir/usr/lib/openomsi/"
  install -m0755 libsteam_api.so "$pkgdir/usr/lib/openomsi/"

  install -d "$pkgdir/usr/bin"
  ln -s ../lib/openomsi/openomsi "$pkgdir/usr/bin/openomsi"
  ln -s ../lib/openomsi/openomsi-launcher "$pkgdir/usr/bin/openomsi-launcher"
  ln -s ../lib/openomsi/openomsi-launcher-app "$pkgdir/usr/bin/openomsi-launcher-app"

  install -Dm644 openomsi.desktop "$pkgdir/usr/share/applications/openomsi.desktop"
  install -Dm644 openomsi.png "$pkgdir/usr/share/pixmaps/openomsi.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
