# Maintainer: Nicolas Derumigny <nderumigny@gmail.com>
pkgname=slang-server
pkgver=0.2.10
pkgrel=1
epoch=
pkgdesc="SystemVerilog Slang Language Server Protocol"
arch=('x86_64')
url="https://github.com/hudson-trading/slang-server"
license=('MIT')
groups=()
depends=('fmt' 'boost')
makedepends=('python' 'cmake' 'gcc' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/hudson-trading/${pkgname}.git#tag=v${pkgver})
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init --recursive
    mkdir -p build/
}

build() {
    cd "${srcdir}/${pkgname}/build"
    cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=False -DSLANG_SERVER_INCLUDE_TESTS=False ..
    cmake --build . --parallel
}

package() {
    cd "${srcdir}/${pkgname}/build"
    DESTDIR="${pkgdir}/" cmake --install .
}
