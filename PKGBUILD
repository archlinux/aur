# Maintainer: Hork <aliyuchang33@outlook.com>
# Maintainer: Leroy.H.Y <admin@lhy0403.top>

pkgname=qv2ray
pkgver=1.3.8.0
pkgrel=1
pkgdesc="Qt cross platform v2ray GUI client"
arch=('i686' 'x86_64')
url="https://github.com/lhy0403/Qv2ray"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'make' 'qt5-tools')
optdepends=('v2ray' 'v2ray-domain-list-community' 'v2ray-geoip')
provides=('Qv2ray')
source=("git+https://github.com/lhy0403/Qv2ray#tag=v$pkgver")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/Qv2ray"
    git submodule update --init
    mkdir build && cd ./build
    qmake ../
    make -j4
}

package() {
    cd "${srcdir}/Qv2ray/build"
    make install INSTALL_ROOT=$pkgdir
    install -Dm644 ../icons/Qv2ray.desktop $pkgdir/usr/share/applications/Qv2ray.desktop
    install -Dm644 ../icons/Qv2ray.png $pkgdir/usr/share/icons/hicolor/256x256/apps/Qv2ray.png
}
