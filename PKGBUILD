# Maintainer: Carlos Silva <r3pek@r3pek.org

pkgname=ratbagd
pkgver=0.0.1
pkgrel=1
pkgdesc='ratbagd is a system daemon to introspect and modify configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/ratbagd'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so' 'libratbag>=0.2')
makedepends=('systemd>=227')
source=("https://github.com/libratbag/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ebe49e42e5347c61c8474aae53b55319c3b7a70f3b2efa7c6f4c1d83aa26a9b5')
conflicts=('ratbagd-git')

build() {
    cd ${pkgname}-${pkgver}

    ./autogen.sh

    ./configure --prefix='/usr' --disable-static
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install

    install -m 644 -t "${pkgdir}"/etc/dbus-1/system.d/ -D dbus/org.freedesktop.ratbag1.conf
}
