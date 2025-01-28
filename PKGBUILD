# Maintainer: VitalyR <vr@vitalyr.com>

pkgname=mps-git
pkgver=r7826.9fd0577cf
pkgrel=3
pkgdesc="Memory Pool System - an automatic memory management system"
arch=('x86_64')
url="https://github.com/Ravenbrook/mps"
license=('BSD')
depends=('glibc')
makedepends=('git' 'gcc' 'make' 'autoconf' 'automake' 'libtool')
provides=('mps')
conflicts=('mps')
source=("git+https://github.com/Ravenbrook/mps.git")
options=(!strip)
sha256sums=('SKIP')

pkgver() {
    cd mps
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd mps
    # workaround: delete "-Werror" in code/gc.gmk for now
    sed -i '/-Werror/d' code/gc.gmk
}

build() {
    cd mps
    ./configure --prefix=/usr
    make -j1
}

package() {
    cd mps
    make DESTDIR="$pkgdir" install
}
