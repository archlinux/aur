# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=veesem
pkgver=0.1
pkgrel=1
pkgdesc='V.Smile emulator'
arch=('x86_64')
url='https://github.com/sp1187/veesem/'
license=('ISC')
depends=('gcc-libs' 'glibc' 'libglvnd' 'sdl2')
makedepends=('cmake')
provides=('veesem')
source=("https://github.com/sp1187/veesem/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('876561542a170c37aca9ae2a9d2e6ac133674320c2b44e46ed42e9cdc07aaf37')

build() {
    cmake \
        -B build \
        -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
