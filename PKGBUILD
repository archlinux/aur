# Maintainer: taotieren <admin@taotieren.com>

pkgname=etherlab
pkgver=2.5.0
pkgrel=1
pkgdesc="An Open Source Toolkit for rapid real time code generation under Linux using Simulink/RTW and EtherCAT technology."
arch=(any)
url="https://gitlab.com/etherlab.org/etherlab"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    python
)
makedepends=(
    git
    cmake
    ninja
)
backup=()
options=()
#install=${pkgname}.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('e802fc40339c0628db25be853a30d8c401ea5c40d9d2ece8c804e6257ea0d260')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    echo ${pkgver} >revision
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
}
