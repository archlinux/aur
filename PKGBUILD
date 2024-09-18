# Maintainer: Vexiona

pkgname=corosync-qdevice
pkgver=3.0.3
pkgrel=1
pkgdesc="The Corosync Cluster Engine Qdevice"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.corosync.org/"
license=('BSD')
depends=('corosync')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corosync/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('6ee9e2016f53162bb352cc2ce2a8ea8a96c3d2b5cf3da5864a69c6f7a3fa54525a1df1f09b571b766822fdb8dd848c6690290da50a5c64ca422514e2aeb11b76')

prepare() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --enable-dbus \
              --enable-monitoring \
              --enable-watchdog \
              --enable-systemd \
              --disable-upstart \
              --enable-snmp \
              --enable-xmlconf \
              --enable-qdevices \
              --enable-qnetd \
              --localstatedir=/var \
              --with-systemddir=/usr/lib/systemd/system \
              --with-tmpfilesdir=/usr/lib/tmpfiles.d
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir/var/run"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=2 et:
