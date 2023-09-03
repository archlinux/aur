# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
pkgname=libdbus-minimal
pkgver=1.14.10
pkgrel=1
pkgdesc="DBus library"
arch=('x86_64')
url="https://wiki.freedesktop.org/www/Software/dbus/"
license=('GPL' 'custom')
provides=('libdbus' 'libdbus-1.so')
conflicts=('libdbus')
source=("https://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.xz"{,.asc})
sha256sums=('ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f'
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
      --enable-option-checking \
      --enable-shared \
      --enable-ld-version-script \
      --disable-silent-rules \
      --disable-maintainer-mode \
      --disable-developer \
      --disable-debug \
      --disable-dependency-tracking \
      --disable-largefile \
      --disable-static \
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
      --disable-qt-help \
      --disable-relocation \
      --disable-stats \
      --disable-user-session \
      --with-pic \
      --with-gnu-ld \
      --without-aix-soname \
      --without-sysroot \
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
      --without-gcov \
      --without-valgrind \
      --without-x \
      --without-qchdir \
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
