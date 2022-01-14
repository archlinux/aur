# Maintainer: database64128 <free122448@hotmail.com>
pkgname=qv2ray-plugin-interface-git
pkgver=r88.b767b4c
pkgrel=1
pkgdesc="Qv2ray plugin interface"
arch=(x86_64)
url="https://github.com/Shadowsocks-NET/Qv2rayBase-PluginInterface"
license=('MIT')
depends=('qt6-base')
makedepends=('git' 'qt6-tools' 'cmake')
provides=('qv2ray-plugin-interface')
conflicts=('qv2ray-plugin-interface')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr
}

package() {
    cd "$srcdir/$pkgname/build"
    cmake --install . --component development
}
