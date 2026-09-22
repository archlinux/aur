# Maintainer: tanwei <contact@tanwei.co>
# Contributor: Shandianshuo

pkgname=shandianshuo
pkgver=0.7.8beta.1
pkgrel=1
pkgdesc="AI voice dictation and communication assistant (闪电说)"
url="https://shandianshuo.cn"
license=("custom")
arch=("x86_64")
depends=(
  "alsa-lib"
  "cairo"
  "dbus"
  "gdk-pixbuf2"
  "glib2"
  "glibc"
  "gstreamer"
  "gtk3"
  "gtk-layer-shell"
  "hicolor-icon-theme"
  "libayatana-appindicator"
  "libevdev"
  "libgcc"
  "libsoup3"
  "libstdc++"
  "libx11"
  "libxcb"
  "webkit2gtk-4.1"
  "wl-clipboard"
  "wtype"
  "xclip"
  "xdg-utils"
  "xdotool"
)
options+=("!strip" "!debug")
source=("$pkgname-$pkgver.deb::https://github.com/shandianshuo/shandianshuo-releases/releases/download/v0.7.8-beta.1/shandianshuo_0.7.8-beta.1_amd64.deb")
sha256sums=('65df81535db2799fe57ecb28561efd5aebd97e296e41fefdd1e3c43a31b8b620')
install="$pkgname.install"

package() {
  # Extract the .deb
  local deb_extract="$srcdir/deb-extract"
  mkdir -p "$deb_extract"
  ar x "$srcdir/$pkgname-$pkgver.deb" -C "$deb_extract"

  # Extract data.tar.gz
  tar -xzf "$deb_extract/data.tar.gz" -C "$pkgdir"

  # Ensure proper permissions
  chmod +x "$pkgdir/usr/bin/shandianshuo"
  chmod +x "$pkgdir/usr/share/shandianshuo/scripts/setup-input-permission.sh"
}
