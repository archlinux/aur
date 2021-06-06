_pkgname=xfswm
pkgname=${_pkgname}-git
pkgver=r12.0dc53b7
pkgrel=2
pkgdesc="An X11 window manager that keeps a single window fullscreen"
url="https://github.com/tomKPZ/xfswm"
arch=("x86_64")
url="https://github.com/tomKPZ/x-active-window-indicator"
depends=("glibc" "libx11")
makedepends=("cmake" "git")

source=("git+https://github.com/tomKPZ/xfswm.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    make DESTDIR="$pkgdir" install
}
