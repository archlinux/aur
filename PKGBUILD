# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=waybox
pkgname=waybox-git
pkgver=0.2.2.r47.g044ce8f
pkgrel=1
pkgdesc='Openbox clone on Wayland (git version)'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('bash' 'glibc' 'libevdev' 'libinput' 'libwlroots-0.20.so' 'libxkbcommon' 'libxml2' 'wayland')
makedepends=('git' 'meson' 'wayland-protocols')
optdepends=("python: for waybox-menu")
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
