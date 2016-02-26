# Maintainer: Carlos Silva <r3pek@r3pek.org

pkgname=ratbagd-git
pkgver=r66.8a8379c
pkgrel=1
pkgdesc='ratbagd is a system daemon to introspect and modify configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so' 'libratbag')
makedepends=('chrpath' 'git' 'systemd')
source=('git+https://github.com/libratbag/ratbagd.git')
sha256sums=('SKIP')

pkgver() {
  cd ratbagd

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd ratbagd

    ./autogen.sh

    ./configure --prefix='/usr' --disable-static
    make
}

package() {
    cd ratbagd

    make DESTDIR="${pkgdir}" install

    install -dm 755 "${pkgdir}"/etc/dbus-1/system.d
    install -m 644 dbus/org.freedesktop.ratbag1.conf "${pkgdir}"/etc/dbus-1/system.d/
}
