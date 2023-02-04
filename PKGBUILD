# Maintainer: Hubert Badocha (badocha.hubert@gmail.com)

pkgname=bear2-git
pkgver=2.4.4.0
pkgrel=1
pkgdesc="Tool to generate compilation database for clang tooling. In version 2."
arch=('i386' 'x86_64')
url="https://github.com/rizsotto/Bear"
license=('GPL3')
makedepends=('git' 'cmake' 'make' 'pkg-config')
depends=('python')
conflicts=('bear' 'bear-git' 'interception-tools')
provides=('bear')
source=("${pkgname}::git+https://github.com/rizsotto/Bear.git")
sha1sums=('SKIP')

prepare() {
    cd "${pkgname}"
    git checkout 2.4.4
}

build() {
    cd "${pkgname}"

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
        .

    make all
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir/" install
}
