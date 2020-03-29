# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=waybox
pkgname=waybox-git
pkgver=r87.114e265
pkgrel=2
pkgdesc='Openbox clone on Wayland (git version)'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('wlroots' 'wayland')
makedepends=('git' 'meson')
conflicts=(waybox)
provides=(waybox)
source=("git+https://github.com/wizbright/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  arch-meson ../build
  ninja -v -C ../build
}

package() {
  cd "$_pkgname"
  DESTDIR="${pkgdir}" meson install -C ../build

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
