# Maintainer: Ainola

pkgname=unruu-git
pkgver=v0.1.1.r18.g39d8a2a
pkgrel=2
pkgdesc='Extracts HTC RUU from .exe files'
license=('GPL3')
arch=('x86_64')
depends=('unshield')
makedepends=('git')
url='https://github.com/kmdm/unruu/'
provides=('unruu')
conflicts=('unruu')
source=('git+https://github.com/kmdm/unruu.git')
sha256sums=('SKIP')

pkgver() {
    cd unruu
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd unruu
    autoreconf -vfi
}

build() {
    cd unruu
    ./configure --prefix=/usr
    make
}

package() {
    cd unruu
    make DESTDIR="$pkgdir" install
}
