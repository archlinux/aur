# Maintainer: taotieren <admin@taotieren.com>

pkgname=pdserv
pkgver=3.3.1
pkgrel=0
pkgdesc="The PdServ library provides process data communication mechanisms for Linux real-time applications in user space (i. e. using RT-PREEMPT). The main focus is placed on providing a process-data interface without interfering real-time operation."
arch=($CARCH)
url="https://gitlab.com/etherlab.org/pdserv"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
    gnutls
    libsasl
    libyaml
    log4cplus
    db
)
makedepends=(
    git
    cmake
    ninja
    #     doxygen
    pkgconf
)
checkdepends=()
optdepends=(
    'pam: PAM (Pluggable Authentication Modules) library')
backup=()
options=()
#install=${pkgname}.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('30bdbbbee81362b282c608b206a4f60f3b5ad274f76d992fcbe412686f6a82a4')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPAM_SERVICE_DIR=/etc/security \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {

    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
}
