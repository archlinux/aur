# Maintainer: xscriptor <preciado.oscar.osorio@gmail.com>
pkgname=xwww-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Efficient animated wallpaper daemon for Wayland, controlled at runtime (prebuilt binaries)"
arch=('x86_64' 'aarch64')
url='https://github.com/x-ports/xwww'
license=('GPL-3.0-only')
depends=('glibc' 'lz4')
provides=('xwww')
conflicts=('xwww' 'xwww-git')
options=('!strip' '!debug')

_target_x86_64='x86_64-unknown-linux-gnu'
_target_aarch64='aarch64-unknown-linux-gnu'

source_x86_64=("xwww-v${pkgver}-${_target_x86_64}.tar.gz::https://github.com/x-ports/xwww/releases/download/v${pkgver}/xwww-v${pkgver}-${_target_x86_64}.tar.gz")
sha256sums_x86_64=('eae64ca1406b05f93651242e864709ea49a91c60d86e4f8762de285f07b44264')

source_aarch64=("xwww-v${pkgver}-${_target_aarch64}.tar.gz::https://github.com/x-ports/xwww/releases/download/v${pkgver}/xwww-v${pkgver}-${_target_aarch64}.tar.gz")
sha256sums_aarch64=('e394676286df620fabc6c7a2399305497e68a39fd210da95cb1e4f2530bdfd7c')

package() {
  local dir
  case "$CARCH" in
    x86_64) dir="xwww-v${pkgver}-${_target_x86_64}" ;;
    aarch64) dir="xwww-v${pkgver}-${_target_aarch64}" ;;
  esac

  install -Dm755 "$dir/xwww"        "$pkgdir/usr/bin/xwww"
  install -Dm755 "$dir/xwww-daemon" "$pkgdir/usr/bin/xwww-daemon"

  install -Dm644 "$dir/completions/xwww.bash" "$pkgdir/usr/share/bash-completion/completions/xwww"
  install -Dm644 "$dir/completions/xwww.fish" "$pkgdir/usr/share/fish/vendor_completions.d/xwww.fish"
  install -Dm644 "$dir/completions/_xwww"     "$pkgdir/usr/share/zsh/site-functions/_xwww"

  install -Dm644 "$dir"/man/*.1 -t "$pkgdir/usr/share/man/man1/"

  install -Dm644 "$dir/contrib/xwww-daemon.service" "$pkgdir/usr/lib/systemd/user/xwww-daemon.service"

  install -Dm644 "$dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
