# Maintainer: Simon Weiss <wonder@simonweiss.space>

pkgname=rox-player-bin
_pkgname=rox
pkgver=1.30.13
pkgrel=1
pkgdesc="Fast, composable music player written in rust (foobar2000 for the current year) (prebuilt binary)"
arch=('x86_64')
url="https://github.com/zealsprince/rox"
license=('AGPL-3.0-only')
# libvulkan, libwayland-client and libX11 are loaded with dlopen, so they
# do not show in the ELF NEEDED list. SQLite is bundled in the binary.
depends=(
  'alsa-lib'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'vulkan-intel: Vulkan support for Intel graphics'
  'vulkan-radeon: Vulkan support for AMD graphics'
  'nvidia-utils: Vulkan support for Nvidia graphics'
  'libglvnd: OpenGL/EGL for the Milkdrop visualizer'
  'noto-fonts-cjk: fast drawing of Japanese, Chinese and Korean text'
)
provides=("rox-player=$pkgver" 'rox')
conflicts=('rox-player' 'rox-player-git')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('16b1ef86f8b12b1cc27acf9e49046132855998ec2c44b9ca65ec50dc3839859b')

package() {
  cd "$_pkgname-v$pkgver-linux-x86_64"

  install -Dm755 rox "$pkgdir/usr/bin/rox"
  install -Dm755 rox-mcp "$pkgdir/usr/bin/rox-mcp"

  install -Dm644 rox.desktop "$pkgdir/usr/share/applications/rox.desktop"
  install -Dm644 rox.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/rox.svg"
  install -Dm644 rox.png "$pkgdir/usr/share/pixmaps/rox.png"
  install -Dm644 rox.metainfo.xml "$pkgdir/usr/share/metainfo/rox.metainfo.xml"

  install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
