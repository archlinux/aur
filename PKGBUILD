# Maintainer: taotieren <admin@taotieren.com>

pkgname=qucs-s-git
pkgver=2.1.0.r41.g38b8df69
pkgrel=2
epoch=
pkgdesc="Qucs-S provides GUI for different circuit simulation kernels. "
arch=('x86_64')
url="https://github.com/ra3xdh/qucs_s"
license=('GPL-2.0')
_qt=qt6
groups=()
depends=($_qt-tools)
makedepends=(cmake
    ninja
    git
    autoconf
    automake
    perl-gd
    perl-xml-libxml
    gperf
    libtool
    flex
    bison
    $_qt-svg)
optdepends=('ngspice: recommended simulation backend'
    'qucs: for Qucsator simulation backend'
    'freehdl: to permit digital circuit simulation'
    'asco: to enable circuit optimization')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=('!makeflags' '!strip')
install=
changelog=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
          -B build \
          -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
