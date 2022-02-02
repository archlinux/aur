# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=waybox
pkgname=waybox-git
pkgver=0.1.0.r0.g402827e
pkgrel=1
pkgdesc='Openbox clone on Wayland (git version)'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('wlroots>=0.15.0' 'wlroots<0.16.0' 'wayland')
makedepends=('git' 'meson')
conflicts=(waybox)
provides=(waybox)
source=("git+https://github.com/wizbright/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
