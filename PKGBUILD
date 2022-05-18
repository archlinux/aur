# Maintainer: hellosway hellosway@protonmail.com
pkgname=mcpppp
pkgver=0.7.1
pkgrel=1
pkgdesc="Converter for minecraft resourcepacks"
arch=('x86_64' 'aarch64')
url="https://github.com/supsm/MCPPPP"
license=('MPL-2.0')
conflicts=(mcpppp-git)
makedepends=("cmake")
source=(https://github.com/supsm/MCPPPP/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('0ae41326374e86ae4b0badf472ad2f741316d4600b43e6e7f6ade812efde77bf')

prepare() {
    cd "${pkgname^^}-$pkgver"
}

build() {
    cd "${pkgname^^}-$pkgver"
    cmake -B build -DMCPPPP_CLI=TRUE -DMCPPPP_GUI=FALSE -DMCPPPP_JNI=FALSE -Wno-dev
    cmake --build build
}

package() {
    cd ${pkgname^^}-$pkgver
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/bin"
    cp build/bin/MCPPPP-cli "$pkgdir/usr/bin"
}
