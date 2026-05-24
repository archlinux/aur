pkgname=arkcode-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A high-performance declarative UI and logic programming language built on C++ & GTK3"
arch=('x86_64' 'aarch64')
url="https://github.com/Aarav90-cpu/arkcode"
license=('Apache')
depends=('gtk3' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'make')
provides=('arkcode' 'aake')
conflicts=('arkcode')
source=("git+https://github.com/Aarav90-cpu/arkcode.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir" cmake --install build
}
