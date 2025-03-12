# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dlpack
pkgname=dlpack
pkgver=1.1
pkgrel=1
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
sha256sums=('2e3b94b55825c240cc58e6721e15b449978cbae21a2a4caa23058b0157ee2fb3')
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
