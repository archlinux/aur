# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

_upstream=RazerGenie
_pkgname=razergenie
pkgname=razergenie-git
pkgver=1.3.0.r0.g160e0e8
pkgrel=1
pkgdesc="Configure and control your Razer devices"
arch=('x86_64')
url="https://github.com/z3ntu/RazerGenie"
license=('GPL-3.0-or-later')
depends=('libopenrazer' 'qt6-base' 'hicolor-icon-theme' 'openrazer-daemon')
makedepends=('git' 'meson' 'qt6-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/z3ntu/RazerGenie.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_upstream
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_upstream" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
