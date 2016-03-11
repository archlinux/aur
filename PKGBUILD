# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=ratbagd
pkgver=0.1.2
pkgrel=1
pkgdesc='ratbagd is a system daemon to introspect and modify configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/ratbagd'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so' 'libratbag>=0.2' 'systemd>=227')
source=("https://github.com/libratbag/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b01d6671bcdcb7880ad211c509b8853f8ecebcacd462533ae1f953d5dd611623')
conflicts=('ratbagd-git')

build() {
    cd ${pkgname}-${pkgver}

    ./autogen.sh

    ./configure \
		--prefix='/usr' \
		--with-systemd-unit-dir=$(pkg-config --variable=systemdsystemunitdir systemd) \
		--with-dbus-root-dir=$(dirname $(pkg-config --variable=system_bus_services_dir dbus-1)) \
		--disable-static
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
}
