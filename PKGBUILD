# Maintainer: hellosway hellosway@protonmail.com
pkgname=mcpppp
pkgver=0.6.1
pkgrel=1
pkgdesc="Converter for minecraft resourcepacks"
arch=('x86_64' 'aarch64')
url="https://github.com/supsm/MCPPPP"
license=('MPL-2.0')
conflicts=(mcpppp-git)
makedepends=("cmake")
source=(https://github.com/supsm/MCPPPP/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('3d399b0c96159b7b7535a321c5fb4160b2da70dc0a67c7d3fda7f0392041ee81')

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
