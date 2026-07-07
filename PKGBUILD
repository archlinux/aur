# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=veesem
pkgver=0.2
pkgrel=1
pkgdesc='V.Smile emulator'
arch=('x86_64')
url='https://github.com/sp1187/veesem/'
license=('ISC')
depends=('dbus' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libstdc++' 'sdl2' 'xdg-desktop-portal')
makedepends=('cmake')
provides=('veesem')
source=("https://github.com/sp1187/veesem/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('18e88d464638e52d29032ff364f013591c163fae4d782c0fda7d34b206f9edae')

build() {
    cmake \
        -B build \
        -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
