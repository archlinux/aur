# Maintainer: Coraline Shuryn <coraline.shuryn@gmail.com>
pkgname=wayback-x11-git
_pkgname=wayback
pkgver=r121.a99951a
pkgrel=1
pkgdesc="An experimental X compatibility layer for Wayland. (git version)"
arch=('x86_64')
url="https://wayback.freedesktop.org/"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots0.19' 'glibc' 'xorg-xwayland' 'scdoc')
makedepends=('git' 'meson' 'wayland-protocols')
conflicts=('wayback-x11')
provides=('wayback-x11')
source=("git+https://gitlab.freedesktop.org/wayback/wayback.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  meson setup _build -Dprefix=/usr -Dlibexecdir="lib/$_pkgname"
  cd _build
  meson compile
}

package() {
  cd "$_pkgname/_build"
  meson install --destdir "$pkgdir"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
