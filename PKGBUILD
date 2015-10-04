# Maintainer: Jack L. Frost <fbt@fleshless.org>
# % Trigger: 1434722047 %
# vim: ft=sh syn=sh ts=2 et

pkgdesc="Standalone systemd libs (including -compat)"
pkgname=( 'libsystemd-standalone' 'libsystemd-login' 'libsystemd-journal' 'libsystemd-id128' 'libsystemd-daemon' 'libsystemd-udev' )
pkgver=226
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gobject-introspection' 'gperf'
             'gtk-doc' 'intltool' 'kmod' 'libcap' 'libgcrypt'  'libmicrohttpd' 'libxslt'
             'linux-api-headers' 'pam' 'python' 'python-lxml' 'quota-tools' 'xz')
options=('strip')
source=( "https://github.com/systemd/systemd/archive/v${pkgver}.tar.gz" )

build() {
  cd "systemd-$pkgver"

  ./autogen.sh
  ./configure --enable-compat-libs

  make
}

package_libsystemd-standalone() {
  install='libsystemd.install'
  provides=( 'libsystemd.so' 'libsystemd' )

  cd "$srcdir/systemd-${pkgver}"
  install -Dm644 .libs/libsystemd.so.0.11.0 "${pkgdir}/usr/lib/libsystemd.so.0.8.0"
  ln -s libsystemd.so.0.10.1 "${pkgdir}/usr/lib/libsystemd.so"

  # Headers
  install -Dm644 src/systemd/_sd-common.h "${pkgdir}/usr/include/systemd/_sd-common.h"
  install -Dm644 src/systemd/sd-messages.h "${pkgdir}/usr/include/systemd/sd-messages.h"
  install -Dm644 src/systemd/sd-bus.h "${pkgdir}/usr/include/systemd/sd-bus.h"
  install -Dm644 src/systemd/sd-event.h "${pkgdir}/usr/include/systemd/sd-event.h"

  install -Dm644 src/libsystemd/libsystemd.pc "${pkgdir}/usr/lib/pkgconfig/libsystemd.pc"
}

package_libsystemd-login() {
  install='libsystemd.install'
  provides=( 'libsystemd-login.so' )

  cd "$srcdir/systemd-${pkgver}"
  install -Dm644 .libs/libsystemd-login.so.0.9.3 "${pkgdir}/usr/lib/libsystemd-login.so.0.9.3"
  ln -s libsystemd-login.so.0.9.3  "${pkgdir}/usr/lib/libsystemd-login.so"

  install -Dm644 src/systemd/sd-login.h "${pkgdir}/usr/include/systemd/sd-login.h"
  install -Dm644 src/compat-libs/libsystemd-login.pc "${pkgdir}/usr/lib/pkgconfig/libsystemd-login.pc"
}

package_libsystemd-journal() {
  install='libsystemd.install'
  provides=( 'libsystemd-journal.so' )

  cd "$srcdir/systemd-${pkgver}"
  install -Dm644 .libs/libsystemd-journal.so.0.11.5 "${pkgdir}/usr/lib/libsystemd-journal.so.0.11.5"
  ln -s libsystemd-journal.so.0.11.5 "${pkgdir}/usr/lib/libsystemd-journal.so"

  install -Dm644 src/systemd/sd-journal.h "${pkgdir}/usr/include/systemd/sd-journal.h"
  install -Dm644 src/compat-libs/libsystemd-journal.pc "${pkgdir}/usr/lib/pkgconfig/libsystemd-journal.pc"
}

package_libsystemd-id128() {
  install='libsystemd.install'
  provides=( 'libsystemd-id128.so' )

  cd "$srcdir/systemd-${pkgver}"
  install -Dm644 .libs/libsystemd-id128.so.0.0.28 "${pkgdir}/usr/lib/libsystemd-id128.so.0.0.28"
  ln -s libsystemd-id128.so.0.0.28 "${pkgdir}/usr/lib/libsystemd-id128.so"

  install -Dm644 src/systemd/sd-id128.h "${pkgdir}/usr/include/systemd/sd-id128.h"
  install -Dm644 src/compat-libs/libsystemd-id128.pc "${pkgdir}/usr/lib/pkgconfig/libsystemd-id128.pc"
}

package_libsystemd-daemon() {
  install='libsystemd.install'
  provides=( 'libsystemd-daemon.so' )

  cd "$srcdir/systemd-${pkgver}"
  install -Dm644 .libs/libsystemd-daemon.so.0.0.12 "${pkgdir}/usr/lib/libsystemd-daemon.so.0.0.12"
  ln -s libsystemd-daemon.so.0.0.12 "${pkgdir}/usr/lib/libsystemd-daemon.so"

  install -Dm644 src/systemd/sd-daemon.h "${pkgdir}/usr/include/systemd/sd-daemon.h"
  install -Dm644 src/compat-libs/libsystemd-daemon.pc "${pkgdir}/usr/lib/pkgconfig/libsystemd-daemon.pc"
}

package_libsystemd-udev() {
  install='libsystemd.install'
  provides=( 'libudev.so' 'libudev' )

  cd "$srcdir/systemd-${pkgver}"
  install -Dm644 .libs/libudev.so.1.6.4 "${pkgdir}/usr/lib/libudev.so.1.6.2"
  ln -s libudev.so.1.6.4 "${pkgdir}/usr/lib/libudev.so"

  install -Dm644 src/libudev/libudev.pc "${pkgdir}/usr/lib/pkgconfig/libudev.pc"
  install -Dm644 src/libudev/libudev.h "${pkgdir}/usr/include/libudev.h"
}

sha1sums=('ac2024c0e708c4f6a9ac4849e808bdfeba2aec19')
