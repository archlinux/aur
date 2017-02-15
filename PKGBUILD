# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=cm256cc-git
pkgver=r80.c89bada
pkgrel=1
pkgdesc="Fast GF(256) Cauchy MDS Block Erasure Codec in C++"
arch=('i686' 'x86_64')
url="https://github.com/f4exb/cm256cc"
license=('BSD')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/f4exb/cm256cc.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
