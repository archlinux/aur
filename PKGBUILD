# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dlpack
pkgname=dlpack
pkgver=1.0
pkgrel=0
pkgdesc="common in-memory tensor structure"
arch=($CARCH)
url="https://github.com/dmlc/dlpack"
license=('Apache-2.0')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
)
makedepends=(
    cmake
    ninja
    pkgconf
)
checkdepends=()
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8cfdcb634ff3cf0e3d9a3426e019e1c6469780a3b0020c9bc4ecc09cf9abcb1')
options=()

build() {
    #     export LDFLAGS="-L/lib64"
    #     if test -n "$LD_LIBRARY_PATH"; then
    #         export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib64"
    #     else
    #         export LD_LIBRARY_PATH=/lib64
    #     fi
    cd "${srcdir}/${pkgname}-${pkgver}/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
}
