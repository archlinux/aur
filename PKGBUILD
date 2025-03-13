# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=csync-release
pkgver=0.8.2
pkgrel=1
pkgdesc="Share your clipboard between different devices"
arch=('x86_64')
url="https://github.com/fioncat/csync"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/csync/releases/download/v${pkgver}/csync-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('bfd71103b39d9188cfdecca000b246b1efcda7e2f289ac63c96a17a486089180')

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
