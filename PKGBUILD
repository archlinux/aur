pkgname=x-active-window-indicator
pkgver=r103.0f2c386
pkgrel=1
pkgdesc="An X11 utility that signals the active window"
url="https://github.com/tomKPZ/x-active-window-indicator"
arch=("x86_64")
license=("GPL3")
depends=("gcc-libs" "glibc" "libxcb")
makedepends=("cmake" "git")

source=("git+https://github.com/tomKPZ/x-active-window-indicator.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}"
    make DESTDIR="$pkgdir" install
}
