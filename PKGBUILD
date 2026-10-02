# Maintainer: Vo1dTear <vo1dtear.01@gmail.com>

pkgname=fooyin-plugin-msuinput-git
pkgver=0.2.0.r0.ga8c885d
pkgrel=1
pkgdesc="An MSU-1 input plugin for fooyin"
url="https://github.com/Vo1dTear/fooyin-plugin-msuinput"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('fooyin')
makedepends=('cmake' 'git')
source=(
  "$pkgname"::"git+https://github.com/Vo1dTear/fooyin-plugin-msuinput.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake -B "$srcdir/build" -S "$srcdir/$pkgname" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
