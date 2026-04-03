# Maintainer: Vinicius Mayrink <vncsmyrnk@gmail.com>
pkgname=gwin-git
pkgver=r21.7b24cbd # This gets auto-updated by the pkgver() function
pkgrel=1
pkgdesc="A \"Run or raise\" CLI tool for Wayland GNOME, leveraging the window-calls extension D-Bus interface for opened windows."
arch=('x86_64')
url="https://github.com/vncsmyrnk/gwin"
license=('GPL-3.0')
depends=('glib2' 'gnome-shell-extension-window-calls-git')
makedepends=('git' 'zig')
provides=('gwin')
conflicts=('gwin')
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
  install -Dm755 "zig-out/bin/gwin" "${pkgdir}/usr/bin/gwin"
}
