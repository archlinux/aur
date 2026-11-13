# Maintainer: dydydd <admin@lidream.cn>
# Co-Maintainer: NyaKang <CoderKang@hotmail.com>

pkgname=nyaterm-bin
pkgver=2.0.5
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
sha256sums_x86_64=('4b4858933fe7bcfcd830f4014ceb45ca0324ab9751697b1a4747db65c5387319')
sha256sums_aarch64=('f982869951b51df35ed42c3f857a2751a5efd067726ae2a3989db53cd1bfbc57')

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
