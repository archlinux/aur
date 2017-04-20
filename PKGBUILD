# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=libratbag
pkgver=0.7
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so')
makedepends=('chrpath' 'systemd' 'meson' 'doxygen' 'graphviz')
source=("https://github.com/libratbag/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('799efcee2f55c81165b84e575634708e76579d4c79727162b122ad285eba037c')
conflicts=('libratbag-git')

build() {
    cd ${pkgname}-${pkgver}

    meson builddir --prefix=/usr/
    ninja -C builddir
}

package() {
    cd ${pkgname}-${pkgver}

    DESTDIR="${pkgdir}" ninja -C builddir install

    install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m 644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/
}
