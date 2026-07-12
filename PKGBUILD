#Maintainer: JustinWayland <justintwayland@gmail.com>
pkgname=helion-acs-git
pkgver=r49.ac660d3
pkgrel=1
pkgdesc="Helion's implementation of ACS"
arch=('x86_64')
url="https://github.com/Helion-Engine/HelionACS"
license=('GPL-3.0-or-later')
depends=('libgcc' 'glibc')
makedepends=('cmake' 'ninja' 'clang' 'git')
provides=('helion-acs')
source=("git+https://github.com/Helion-Engine/HelionACS")
sha256sums=("SKIP")

pkgver() {
    cd "HelionACS"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "HelionACS"
    mkdir -p ./build-native/linux-x64
    cmake -B ./build-native/linux-x64 -G Ninja -DCMAKE_BUILD_TYPE=Release
    cmake --build ./build-native/linux-x64
}

package() {
    cd "HelionACS"
    install -Dm755 build-native/linux-x64/libHelionACS-native.so "$pkgdir/usr/lib/libHelionACS-native.so"
    install -Dm755 build-native/linux-x64/libHelionACS-native-static.a "$pkgdir/usr/lib/libHelionACS-native.a"
}
