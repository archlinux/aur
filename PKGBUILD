# Maintainer: taotieren <admin@taotieren.com>

pkgname=etherlab
pkgver=2.4.0
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

sha256sums=('14f3e15dd3e84b604d6b7fef4586a85e1a70504fec73b2917bed27c5582b3455')

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
