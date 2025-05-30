# Maintainer: Maks Verver <maks@verver.ch>

pkgname=par3cmdline-git
pkgver=0.0.1.r289.a347d92
pkgrel=1
pkgdesc='PAR 3.0 compatible file verification and repair tool'
url='https://github.com/Parchive/par3cmdline/'
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=('git+https://github.com/parchive/par3cmdline')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    echo "0.0.1.r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -S src -B build -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr
    cmake --build build --parallel
}

check() {
    cd "${srcdir}/${pkgname}"

    ctest --test-dir build
}

package() {
    cd "${srcdir}/${pkgname}"

    DESTDIR=${pkgdir} cmake --install build
}
