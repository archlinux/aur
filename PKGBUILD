# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=jacques-ctf-git
pkgver=r199.4d68935
pkgrel=1
pkgdesc='Jacques CTF is an interactive CTF trace inspection tool with a terminal user interface'
arch=('any')
license=('MIT')
depends=('yactfr' 'ncurses' 'boost-libs')
makedepends=('git' 'cmake')
url='https://github.com/eepp/jacques-ctf'
provides=('jacques-ctf')
conflicts=('jacques-ctf')
source=("$pkgname::git+https://github.com/eepp/jacques-ctf")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    cmake -B build \
          -DCMAKE_BUILD_TYPE=release \
          -DCMAKE_INSTALL_PREFIX="/usr"
    make -C build -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname"

    make -C build DESTDIR="$pkgdir" install
}
