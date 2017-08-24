# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=interception-tools
pkgver=0.1.1
pkgrel=1
pkgdesc='A minimal composable infrastructure on top of libudev and libevdev'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://gitlab.com/interception/linux/tools'
depends=('yaml-cpp' 'libevdev')
makedepends=('cmake' 'gcc')
source=("https://gitlab.com/interception/linux/tools/repository/archive.tar.gz?ref=v${pkgver}"
        'udevmon.service')
md5sums=('033f4c3e81e4d7865314ad2873e3d158'
         'fcbd860d3bce12e30b3bfdd03c6b35a5')

build() {
    cd ${srcdir}/tools-v${pkgver}-*
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd ${srcdir}/tools-v${pkgver}-*

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 444 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "${srcdir}/udevmon.service" "${pkgdir}/usr/lib/systemd/system"

    make install
}
