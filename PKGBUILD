# Maintainer: dydydd <admin@lidream.cn>
# Co-Maintainer: NyaKang <CoderKang@hotmail.com>

pkgname=nyaterm-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Native GPUI terminal workspace with SSH, SFTP, RDP and VNC"
arch=('x86_64' 'aarch64')
url="https://github.com/nyakang/nyaterm"
license=('Apache-2.0')
options=(!debug)
depends=('dbus' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'openssl' 'systemd-libs' 'wayland' 'zstd')
optdepends=('vulkan-icd-loader: Vulkan loader required by GPUI' 'vulkan-driver: hardware-specific Vulkan implementation')
source=("LICENSE::$url/raw/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/NyaTerm_${pkgver}_linux_x64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/NyaTerm_${pkgver}_linux_arm64.deb")
sha256sums=('e0360c0b8e0dc3d944033910279d7736d72a51a6639278ede8807e74fe4c1de9')
sha256sums_x86_64=('1b0dcff002ffa08430bbcb03d390c771e931c8114077ff6587c7e6677ded1413')
sha256sums_aarch64=('b7d0eea3f7ac8f192c3ef6adbf5c35aaa9553e32bb2d42c869917937d9aecf6d')

package() {
  local deb="$srcdir/$pkgname-$pkgver-$CARCH.deb"
  local unpack="$srcdir/deb-payload"
  rm -rf "$unpack"
  mkdir -p "$unpack" "$pkgdir"
  cd "$unpack"
  ar x "$deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /opt/nyaterm/nyaterm "$pkgdir/usr/bin/nyaterm"
  install -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
