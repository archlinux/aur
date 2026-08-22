# Maintainer: Uyanide <pywang0608@foxmail.com>

pkgname=wallreel
pkgver=2.2.2
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
sha512sums=('65888003afe750a71fb08da111d5e4fc06f310f112d199881d96b1e0d5b21a1e803a6bba5e093ce097d7a9c9cad391c0240bebba27ece01d25db632fb32915b2')

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
