# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=codequery
pkgver=1.1.0
pkgrel=1
pkgdesc="A code-understanding, code-browsing or code-search tool"
arch=('x86_64')
url="http://ruben2020.github.io/codequery"
license=('MPL-2.0')
depends=('glibc' 'libgcc' 'qt6-5compat' 'qt6-base' 'sqlite')
makedepends=('cmake' 'qt6-tools')
optdepends=('cscope: to create CodeQuery databases'
            'ctags: to create CodeQuery databases')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ruben2020/codequery/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('6e893332f623dcb82256afcd4347084e4135e2fdb5f765865773ad6f6e64f3fe'
            '1448fb7690e6b33cee50dffa8dc89654eba96e5910ae731b1b1486c46d72922a')

build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -S "${pkgname}-${pkgver}"
        -W no-dev
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgname}-${pkgver}/gui/images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
