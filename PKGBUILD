# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=interception-tools
pkgver=0.1.1
pkgrel=6
pkgdesc='A minimal composable infrastructure on top of libudev and libevdev'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/interception/linux/tools'
depends=('libevdev' 'yaml-cpp')
makedepends=('cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/tools/repository/archive.tar.gz?ref=v${pkgver}"
        'udevmon.service')
md5sums=('033f4c3e81e4d7865314ad2873e3d158'
         '45fca55908e2e6e61d83d9074347bcd4')

build() {
    cd ${srcdir}/tools-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/tools-v${pkgver}-*/build

    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "${srcdir}/udevmon.service" "${pkgdir}/usr/lib/systemd/system"

    make DESTDIR="$pkgdir/" install
}
