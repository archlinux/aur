# Maintainer: Igor Khanin <igor at khanin dot biz>
pkgname=katvan
pkgver=0.6.0
pkgrel=1
pkgdesc='A bare-bones editor for Typst files, with a bias for RTL editing'
arch=('x86_64')
url='https://github.com/IgKh/katvan'
license=('GPL-3.0-or-later')
depends=('qt6-base'
         'qt6-webengine'
         'hunspell'
         'gcc-libs'
         'glibc'
         'hicolor-icon-theme')
makedepends=('cmake'
             'qt6-tools'
             'gtest')
optdepends=('typst: for previews and PDF export')
source=("https://github.com/IgKh/katvan/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.gz")
sha256sums=('8c1a4eb6e9047bdb3196fd9761c16c36560fd22a87bd1bc5627cc5672b63c946')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

