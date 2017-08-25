# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=ratbagd
pkgver=0.4
pkgrel=2
pkgdesc='ratbagd is a system daemon to introspect and modify configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/ratbagd'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so' 'libratbag>=0.2' 'systemd>=227')
makedepends=('meson' 'check')
source=("https://github.com/libratbag/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d216b964dcc16c40355b1b224019d7476d4128f6533e51d46a873b66eaec86dd')
conflicts=('ratbagd-git libratbag>=0.9.900')

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
