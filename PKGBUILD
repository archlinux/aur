# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Miha Frangež <miha.frangez at gmail dot com>
pkgname=ddcui-git
pkgver=0.4.2.r0.g03a902f
pkgrel=1
pkgdesc="Graphical user interface for ddcutil - control monitor settings"
arch=('x86_64')
url="https://www.ddcutil.com"
license=('GPL2')
depends=('ddcutil>=2.0.0' 'qt5-base')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rockowitz/ddcui.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
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
