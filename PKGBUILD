# Maintainer: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: gilbus <aur@tinkershell.eu>
pkgname=swaylock-plugin-git
pkgver=1.8.0.r21.g969b502
pkgrel=1
pkgdesc='Screen locker for Wayland -- Fork with background plugin support '
url='https://github.com/mstoeckl/swaylock-plugin'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('wayland' 'libxkbcommon' 'pam' 'cairo' 'gdk-pixbuf2' 'swaybg' 'systemd')
makedepends=('meson' 'git' 'scdoc' 'wayland-protocols')
optdepends=('mpvpaper')
source=("${pkgname%-git}::git+$url")
sha1sums=('SKIP')
provides=("${pkgname%-git}=${pkgver%%.r*}")

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  arch-meson build "${pkgname%-git}" -Dwerror=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
