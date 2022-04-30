# Maintainer: hellosway hellosway@protonmail.com
pkgname=mcpppp
pkgver=0.7.0
pkgrel=2
pkgdesc="Converter for minecraft resourcepacks"
arch=('x86_64' 'aarch64')
url="https://github.com/supsm/MCPPPP"
license=('MPL-2.0')
conflicts=(mcpppp-git)
makedepends=("cmake")
source=(https://github.com/supsm/MCPPPP/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('bd09e3d594535063aa586aeeab24b700b607998a0193f23a25e119396e3177d1')

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
