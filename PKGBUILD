# Maintainer: taotieren <admin@taotieren.com>

pkgname=gpds
pkgver=1.9.0
pkgrel=1
epoch=
pkgdesc="A general purpose data serializer"
arch=($CARCH)
url="https://github.com/simulton/gpds"
license=('LicenseRef-SimultonGmbH')
groups=()
depends=(
    glibc
    libgcc
    libstdc++
)
makedepends=(
    cmake
    ninja
    git
    tinyxml2
)
optdepends=(

)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('51c5b20cff184bf9326acc3bff449fd8d60239d20f043eb32a5a594cfbdc1cda')
validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D OPTION_BUILD_SHARED_DEFAULT=ON \
        -D GPDS_BUILD_STATIC=OFF \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm644 license.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
