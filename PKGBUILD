# Maintainer: taotieren <admin@taotieren.com>

pkgname=etherlab
pkgver=2.6.0
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
    "${pkgname}::git+${url}.git#tag=${pkgver}")

sha256sums=('d07cb1000bfd9d57916b6ac51f0fe674182ef7c32033c16e87d242aa6735a226')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    echo ${pkgver} >revision
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
