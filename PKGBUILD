# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Miha Frangež <miha.frangez at gmail dot com>
pkgname=ddcui-git
pkgver=0.5.2.r1.gee89c31
pkgrel=1
pkgdesc="Graphical user interface for ddcutil - control monitor settings"
arch=('x86_64')
url="https://github.com/rockowitz/ddcui"
license=('GPL-2.0-or-later')
depends=('ddcutil>=2.1.3' 'hicolor-icon-theme' 'qt5-base')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rockowitz/ddcui.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='None' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
