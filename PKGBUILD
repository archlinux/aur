# Maintainer: 古方元水 <ye@archlinux>
# Contributor: 糯米狐 <nuomihu@archlinux>

pkgname=hanako-bin
pkgver=0.222.30
pkgrel=4
pkgdesc="Hanako - a personal AI agent with memory and soul"
arch=('x86_64')
url="https://github.com/liliMozi/openhanako"
license=('MIT')
depends=(
  'gtk3'
  'libxss'
  'libxtst'
  'libxkbcommon'
  'libxrandr'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxext'
  'libxrender'
  'nss'
  'nspr'
  'cups'
  'mesa'
  'egl-wayland'
  'at-spi2-core'
  'libcups'
  'dbus'
  'fuse2'
)
optdepends=(
  'pipewire: audio support'
  'pulseaudio: audio support (fallback)'
  'appimagelauncher: desktop integration for AppImages'
)
options=('!strip' '!debug')
provides=('hanako')
conflicts=('hanako')
source=("https://github.com/liliMozi/openhanako/releases/download/v${pkgver}/Hanako-${pkgver}-Linux-x86_64.AppImage")
sha512sums=('551d869c897d3224e7121e24ed512a6fadc8e9200fb028d0536cf4833c1598e395aa2b1814faf32edbf1ed119fdf090e5215bcfdc91b8bb74e086bea2f25faad')

package() {
  install -Dm755 "${srcdir}/Hanako-${pkgver}-Linux-x86_64.AppImage" \
    "${pkgdir}/opt/hanako/Hanako.AppImage"

  # CLI wrapper — 不裝 desktop entry，交給 appimagelauncher
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/hanako" << 'BINEOF'
#!/bin/sh
exec /opt/hanako/Hanako.AppImage "$@"
BINEOF
}
