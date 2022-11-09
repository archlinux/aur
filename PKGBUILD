# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
pkgname=libdbus-minimal
pkgver=1.14.4
pkgrel=1
pkgdesc="DBus library"
arch=('x86_64')
url="https://wiki.freedesktop.org/www/Software/dbus/"
license=('GPL' 'custom')
provides=('libdbus' 'libdbus-1.so')
conflicts=('libdbus')
source=("https://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.xz"{,.asc})
sha256sums=('7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e'
            'SKIP')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie <simon.mcvittie@collabora.co.uk>

build() {
  cd "$srcdir/dbus-$pkgver"
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --runstatedir=/run \
      --libexecdir=/usr/lib/dbus-1.0 \
      --enable-shared \
      --enable-ld-version-script \
      --disable-static \
      --disable-option-checking \
      --disable-silent-rules \
      --disable-maintainer-mode \
      --disable-developer \
      --disable-debug \
      --disable-dependency-tracking \
      --disable-largefile \
      --disable-fast-install \
      --disable-libtool-lock \
      --disable-ansi \
      --disable-verbose-mode \
      --disable-asserts \
      --disable-checks \
      --disable-xml-docs \
      --disable-doxygen-docs \
      --disable-ducktype-docs \
      --disable-selinux \
      --disable-apparmor \
      --disable-libaudit \
      --disable-inotify \
      --disable-kqueue \
      --disable-console-owner-file \
      --disable-launchd \
      --disable-systemd \
      --disable-traditional-activation \
      --disable-embedded-tests \
      --disable-modular-tests \
      --disable-tests \
      --disable-installed-tests \
      --disable-code-coverage \
      --disable-epoll \
      --disable-x11-autolaunch \
      --disable-compile-warnings \
      --disable-Werror \
      --disable-relocation \
      --disable-stats \
      --disable-user-session \
      --disable-containers \
      --with-pic \
      --with-gnu-ld \
      --without-gcov \
      --without-valgrind \
      --without-x \
      --without-session-socket-dir \
      --without-test-socket-dir \
      --without-system-pid-file \
      --without-system-socket \
      --without-console-auth-dir \
      --without-console-owner-file \
      --without-launchd-agent-dir \
      --without-dbus-user \
      --without-test-user \
      --without-dbus-daemondir \
      --without-systemdsystemunitdir \
      --without-systemduserunitdir \
      --without-dbus-test-dir \
      --without-dbus-session-bus-listen-address \
      --without-dbus-session-bus-connect-address
  make
}

package() {
  cd "$srcdir/dbus-$pkgver"
  make DESTDIR="$pkgdir" -C dbus install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libdbus/COPYING"
}
