# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_upstream=RazerGenie
_pkgname=razergenie
pkgname=razergenie-git
pkgver=0.7.r167.g776e653
pkgrel=1
pkgdesc="Qt application for configuring your Razer devices under GNU/Linux."
arch=('x86_64')
url="https://github.com/z3ntu/RazerGenie"
license=('GPL3')
depends=('libopenrazer' 'qt5-base' 'hicolor-icon-theme' 'openrazer-daemon')
makedepends=('git' 'meson' 'qt5-tools')
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
