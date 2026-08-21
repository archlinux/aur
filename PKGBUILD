# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=wallreel
pkgver=2.2.1
pkgrel=1
pkgdesc="Choose and set desktop wallpapers with customizable themes and actions"
arch=('x86_64')
url="https://git.uyani.de/Uyanide/WallReel"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'libgcc'
    'libstdc++'
    'glibc'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
)
optdepends=(
    'qqc2-desktop-style: native Plasma look and feel'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d1747fb3a773ae5840f367b53a4014fc86284e332ef2437b864be51ba426f3a733d5a201319e14f09f56ee25180880205c374cd5ea13f30fdc1fe48401205375')

build() {
    cd "${pkgname}"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
