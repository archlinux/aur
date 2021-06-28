# Maintainer: database64128 <free122448@hotmail.com>
pkgname=qv2ray-plugin-interface-git
pkgver=v4.0.pre1.r0.626190c
pkgrel=1
pkgdesc="Qv2ray plugin interface"
arch=(x86_64)
url="https://github.com/moodyhunter/Qv2rayBase-PluginInterface"
license=('GPL3')
depends=('qt6-base' 'qjsonstruct')
makedepends=('git' 'qt6-tools' 'cmake' 'ninja')
provides=('qv2ray-plugin-interface')
conflicts=('qv2ray-plugin-interface')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake .. -GNinja \
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DCMAKE_BUILD_TYPE=Release
    ninja
}

package() {
    cd "$srcdir/$pkgname"
    ninja -C "build" install
}
