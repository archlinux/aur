# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=yactfr-git
pkgver=r278.f29ee1b
pkgrel=1
pkgdesc='yactfr is yet another common trace format (CTF) reader'
arch=('any')
license=('MIT')
makedepends=('git' 'cmake' 'boost' 'doxygen')
url='https://github.com/eepp/yactfr'
provides=('yactfr')
conflicts=('yactfr')
source=("$pkgname::git+https://github.com/eepp/yactfr")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    cmake -B build \
          -DCMAKE_BUILD_TYPE=release \
          -DOPT_BUILD_DOC=NO \
          -DCMAKE_INSTALL_PREFIX="/usr"
    make -C build -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname"

    make -C build DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/doc/yactfr"
}
