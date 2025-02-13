# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.6.4
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('7466195114453dadf3cb6a3e86cf8a529d79fead40892074f4e8f98a5a7f4472')

options=('!strip' '!debug')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'xdotool'
  'libappindicator-gtk3'
)

depends_wayland=('wl-clipboard')

package() {
  if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    depends+=("${depends_wayland[@]}")
  fi

  install -Dm755 "csync-server" "$pkgdir/usr/bin/csync-server"
  install -Dm755 "csyncd" "$pkgdir/usr/bin/csyncd"
  install -Dm755 "csynctl" "$pkgdir/usr/bin/csynctl"
}
