# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=ratbagd
pkgver=0.3
pkgrel=1
pkgdesc='ratbagd is a system daemon to introspect and modify configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/ratbagd'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so' 'libratbag>=0.2' 'systemd>=227')
makedepends=('meson' 'check')
source=("https://github.com/libratbag/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9213d7677749d91a755a2800319d04b97bea4fc0c08c3ff2da535732add18f1a')
conflicts=('ratbagd-git')

build() {
    cd ${pkgname}-${pkgver}

    meson builddir \
        --prefix=/usr

    ninja -C builddir
}

package() {
    cd ${pkgname}-${pkgver}

    DESTDIR="${pkgdir}" ninja -C builddir install

    install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m 644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/
}
