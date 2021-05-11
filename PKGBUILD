# Maintainer: Francisco Lopes <francisco+interception@nosubstance.me>
pkgname=interception-uswitch
pkgver=0.1.2
pkgrel=1
pkgdesc='uswitch: an Interception Tools tool to redirect stdin to a muxer if logged user matches'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/interception/linux/plugins/uswitch'
depends=('interception-tools' 'glibc')
makedepends=('boost' 'cmake' 'gcc')
source=("https://gitlab.com/interception/linux/plugins/uswitch/-/archive/v${pkgver}/uswitch-v${pkgver}.tar.gz")
sha256sums=('26d4278830ecdd414978263196408455385a65e554976aea3fb9fb10dd443b49')

build() {
    cd ${srcdir}/uswitch-v${pkgver}
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/uswitch-v${pkgver}/build

    make DESTDIR="$pkgdir/" install

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 ../LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}"

    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}"
}
