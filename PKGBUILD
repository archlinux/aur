# Maintainer: Antoni Marzec <marzeqmarzeq@gmail.com>
pkgname=wlcrosshair
pkgver=1.3
pkgrel=1
pkgdesc="Simple crosshair overlay for Wayland compositors"
arch=("x86_64" "aarch64")
url="https://github.com/marzeq/wlcrosshair"
license=("MIT")
depends=("glibc" "wayland" "libpng")
makedepends=("git" "pkgconf")
source=("${pkgname}::git+https://github.com/marzeq/wlcrosshair.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install-bin
  install -Dm644 doc/wlcrosshair.1 "$pkgdir/usr/share/man/man1/wlcrosshair.1"
  install -Dm644 doc/wlcrosshairctl.1 "$pkgdir/usr/share/man/man1/wlcrosshairctl.1"
  install -Dm644 completions/wlcrosshairctl.bash "$pkgdir/usr/share/bash-completion/completions/wlcrosshairctl"
  install -Dm644 completions/wlcrosshairctl.zsh "$pkgdir/usr/share/zsh/site-functions/_wlcrosshairctl"
  install -Dm644 completions/wlcrosshairctl.fish "$pkgdir/usr/share/fish/vendor_completions.d/wlcrosshairctl.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
