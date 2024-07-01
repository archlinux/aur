# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libosal
pkgname=libosal
pkgver=0.0.3
pkgrel=1
pkgdesc="libosal is an operating system abstraction layer Library. It's purpose is to write os-independent code for easy portability between different systems and architectures."
arch=($CARCH)
url="https://github.com/robert-burger/libosal"
license=('LGPL-3.0-only')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(glibc)
makedepends=(
#     cmake
#     ninja
    pkgconf)
checkdepends=()
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}-rev0.tar.gz")
sha256sums=('6c66cb58275f6e5deb1810853d08e713f19d4076e7ac33ac302bf8420c94729d')
options=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-rev0/"
    autoreconf -is
    ./configure --prefix=/usr
    make

# see：https://wiki.archlinux.org/title/CMake_package_guidelines
# gcc build
#     cmake -DCMAKE_BUILD_TYPE=Release \
#     cmake -DCMAKE_BUILD_TYPE=None \
#         -DBUILD_FOR_PLATFORM="POSIX" \
#         -DBUILD_SHARED_LIBS=ON \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_INSTALL_LIBDIR=lib \
#         -DCMAKE_INSTALL_LIBEXECDIR=lib \
#         -B build \
#         -Wno-dev \
#         -G Ninja
#
#     ninja -C build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}-rev0"
    make check
}

package() {
#     DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}-rev0/build install
    cd "${srcdir}/${pkgname}-${pkgver}-rev0"
    make DESTDIR=${pkgdir} install
}
