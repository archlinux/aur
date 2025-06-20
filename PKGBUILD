# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
pkgname=libdbus-minimal
pkgver=1.16.2
pkgrel=1
pkgdesc="DBus library"
arch=('x86_64')
url="https://wiki.freedesktop.org/www/Software/dbus/"
license=('AFL-2.1 OR GPL-2.0-or-later')
makedepends=('meson')
provides=('libdbus' 'libdbus-1.so')
conflicts=('libdbus')
source=("https://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.xz"{,.asc})
sha256sums=('0ba2a1a4b16afe7bceb2c07e9ce99a8c2c3508e5dec290dbb643384bd6beb7e2'
            'SKIP')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90') # Simon McVittie <simon.mcvittie@collabora.co.uk>

build() {
  cd "$srcdir/dbus-$pkgver"
  arch-meson . build \
    -D apparmor=disabled \
    -D asserts=false \
    -D checks=false \
    -D dbus_daemondir= \
    -D dbus_user= \
    -D dbus_session_bus_connect_address= \
    -D dbus_session_bus_listen_address= \
    -D doxygen_docs=disabled \
    -D ducktype_docs=disabled \
    -D intrusive_tests=false \
    -D epoll=disabled \
    -D inotify=disabled \
    -D installed_tests=false \
    -D kqueue=disabled \
    -D launchd=disabled \
    -D launchd_agent_dir= \
    -D libaudit=disabled \
    -D message_bus=false \
    -D modular_tests=disabled \
    -D qch_dir= \
    -D qt_help=disabled \
    -D relocation=disabled \
    -D runtime_dir= \
    -D selinux=disabled \
    -D session_socket_dir= \
    -D solaris_console_owner_file= \
    -D stats=false \
    -D system_pid_file= \
    -D system_socket= \
    -D systemd_system_unitdir= \
    -D systemd_user_unitdir= \
    -D systemd=disabled \
    -D test_socket_dir= \
    -D test_user= \
    -D tools=false \
    -D traditional_activation=false \
    -D user_session=false \
    -D valgrind=disabled \
    -D verbose_mode=false \
    -D x11_autolaunch=disabled \
    -D xml_docs=disabled \
    -D windows_output_debug_string=false
  meson compile -C build
}

package() {
  cd "$srcdir/dbus-$pkgver"
  meson install -C build --destdir "$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING LICENSES/AFL-2.1.txt
}
