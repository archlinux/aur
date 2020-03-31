# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.3.1
pkgrel=1
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=('x86_64')
url="https://github.com/alex1701c/JetBrainsRunner"
license=('LGPL3')
depends=('krunner')
makedepends=('cmake' 'extra-cmake-modules')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/JetBrainsRunner.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('af7e0d4239bb693459b75229b308a629a1c397e958f8cde05ba2860ec87551cb')

prepare() {
    mkdir -p $pkgname-$pkgver
    tar xzf $pkgname-$pkgver.tar.gz -C $pkgname-$pkgver --strip-components 1
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
