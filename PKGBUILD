# Maintainer: Vinicius Mayrink <vncsmyrnk@gmail.com>
pkgname=gnome-window-calls-git
pkgver=r9.975f9c1 # This gets auto-updated by the pkgver() function
pkgrel=1
pkgdesc="D-Bus client for manipulating windows in GNOME using the window-calls extension."
arch=('x86_64')
url="https://github.com/vncsmyrnk/gnome-window-calls"
license=('GPL-3.0')
depends=('glib2' 'gnome-shell-extension-window-calls-git')
makedepends=('git' 'zig')
provides=('gnome-window-calls')
conflicts=('gnome-window-calls')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}" || return
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}" || return
  zig build -Doptimize=ReleaseFast --global-cache-dir "${srcdir}/zig-cache"
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "zig-out/bin/gwc" "${pkgdir}/usr/bin/gwc"
}
