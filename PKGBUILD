# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=waybox
pkgname=waybox-git
pkgver=0.2.2.r1.gae42d9d
pkgrel=1
pkgdesc='Openbox clone on Wayland (git version)'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('wlroots>=0.17.0' 'wlroots<0.19.0')
makedepends=('git' 'meson' 'wayland-protocols')
conflicts=(waybox)
provides=(waybox)
source=("git+https://github.com/wizbright/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m 644 "$_pkgname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
