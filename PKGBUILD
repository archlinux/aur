pkgname=wayclip-cli
pkgver=0.1.34
pkgrel=1
pkgdesc="CLI for Wayclip"
arch=('x86_64')
url="https://github.com/wayclip/cli"
license=('MIT')
depends=('bzip2' 'elfutils' 'glib2' 'libffi' 'libunwind' 'openssl' 'pcre2' 'util-linux-libs' 'xz' 'zlib' 'zstd' 'pipewire' 'wayland' 'alsa-lib' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'postgresql-libs' 'dbus' 'libxcb')
makedepends=('rust' 'cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/releases/download/v0.1.2/wayclip-v0.1.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  tar -xzf "$pkgname-$pkgver.tar.gz"
  mkdir -p wayclip-core
  tar -xzf "wayclip-core.tar.gz" -C wayclip-core
}

build() {
  cd "$srcdir/cli-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/cli-$pkgver/target/release/wayclip_cli" "$pkgdir/usr/bin/wayclip-cli"
  install -Dm755 "$srcdir/wayclip-core/wayclip-binaries/daemon" "$pkgdir/usr/bin/wayclip-daemon"
  install -Dm755 "$srcdir/wayclip-core/wayclip-binaries/trigger" "$pkgdir/usr/bin/wayclip-trigger"
}
