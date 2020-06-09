# Maintainer:Francois Menning <f.menning@pm.me>
# Contributor: gilbus <aur(AT)tinkershell.eu>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=thermald
_pkgname=thermal_daemon
pkgver=2.2
pkgrel=1
pkgdesc="The Linux Thermal Daemon program from 01.org"
arch=('x86_64')
url="https://01.org/linux-thermal-daemon"
license=('GPL2')
makedepends=('systemd' 'python' 'autoconf-archive')
depends=('dbus-glib' 'libxml2')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/intel/${_pkgname}/archive/v${pkgver}.tar.gz"
        'modules-load-thermald.conf')
sha256sums=('d23042e84dbd8a81c32fdc7bef3e2524b75ec68184a9ae3a324f54de382ea23f'
            '0155e1eb459306d251a5a049ffc6c11e144fa8caa75901ac5fa20bd52e05d515')

build() {
  cd ${_pkgname}-${pkgver}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/modules-load-thermald.conf "${pkgdir}"/usr/lib/modules-load.d/thermald.conf
}
