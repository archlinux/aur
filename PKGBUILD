pkgname=injectd-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to inject custom boot messages into the console"
arch=('x86_64' 'aarch64')
url="https://github.com/b6d5b38e0d7ae6bd0d951815cd92df43/injectd"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
provides=("injectd")
conflicts=("injectd")
source=("git+https://github.com/b6d5b38e0d7ae6bd0d951815cd92df43/injectd.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir" cmake --install build
}
