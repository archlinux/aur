# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=libratbag
pkgver=0.5
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so')
makedepends=('chrpath' 'systemd')
source=("https://github.com/libratbag/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2d7496f9272eb555a66267112b28983327312425675382b84665d3202b26f35e')
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
