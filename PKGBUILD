# Maintainer: jxc <ab790430@petalmail.com>
pkgname=dimension-esports
_pkgname=dimension-esports-git
pkgver=r6.537de6d
pkgrel=1
pkgdesc="A DeepSeek AI chat desktop client built with Qt 6 and WebEngine"
arch=('x86_64')
url="https://gitee.com/jxc20120414/Dimension-Esports.git"
license=('MIT')
depends=('qt6-base' 'qt6-webengine')
makedepends=('git' 'cmake' 'qt6-tools')
provides=('deepseekqt')
conflicts=('deepseekqt')
source=("$pkgname::git+https://gitee.com/jxc20120414/Dimension-Esports.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
