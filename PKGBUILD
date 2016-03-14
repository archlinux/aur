# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=libratbag
pkgver=0.4
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so')
makedepends=('chrpath' 'systemd')
source=("https://github.com/libratbag/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('75365cf6a3571a65bcbcb0444bf638ba5190cb68d1bf65213a6173e6843062f0')
conflicts=('libratbag-git')
install=libratbag.install

build() {
    cd ${pkgname}-${pkgver}

    ./autogen.sh \
    --prefix='/usr'\
    --disable-static

    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
    chrpath -d "${pkgdir}"/usr/bin/ratbag-command

    install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m 644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/
}
