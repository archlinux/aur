# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# PKGBUILD based on the one from https://aur.archlinux.org/packages/lite-xl

pkgname=lite-xl-git
_pkgname=lite-xl
pkgver=2.0.2.r114.gefbec1e
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64')
url="https://lite-xl.github.io/"
license=('MIT')
depends=('lua52' 'sdl2' 'freetype2' 'pcre2' 'hicolor-icon-theme')
makedepends=('meson>=0.58')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lite-xl/lite-xl")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}


build() {
  cd "${_pkgname}"
  arch-meson build --wrap-mode default
  meson compile -C build
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" meson install --skip-subprojects -C build

  install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
