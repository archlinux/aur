# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-xswitch
pkgver=0.1.7
pkgrel=1
pkgdesc='xswitch: an Interception Tools tool to redirect stdin to a muxer if a X window matches'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/xswitch'
depends=('interception-tools' 'glibc' 'libx11' 'libxmu')
makedepends=('boost' 'cmake' 'gcc')
source=("https://gitlab.com/interception/linux/plugins/xswitch/-/archive/v${pkgver}/xswitch-v${pkgver}.tar.gz")
sha256sums=('481127c2337502b2b98a8053fb69333b6f95b8aaf5696921c2845545db718446')

build() {
    cd ${srcdir}/xswitch-v${pkgver}
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/xswitch-v${pkgver}/build

    make DESTDIR="$pkgdir/" install

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 ../LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}"
}
