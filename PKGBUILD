# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Janosch Dobler <janosch.dobler AT gmx DOT de>

pkgbase=libgtkflow-git
pkgname=('libgflow-git' 'libgtkflow3-git' 'libgtkflow4-git')
pkgver=r497.c276040
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url="https://notabug.org/grindhold/libgtkflow"
license=('GPL3')
makedepends=('git' 'meson' 'vala' 'gobject-introspection' 'gtk3' 'gtk4')
optdepends=('python-gobject: usage from python'
            'lua-lgi: usage from lua')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgbase%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build && cd build

  # valadoc can be enabled back once it stops putting its files in /tmp,
  # see https://notabug.org/grindhold/libgtkflow/issues/45
  arch-meson ../${pkgbase%-*} -Denable_valadoc=false

  ninja
  DESTDIR=../fake-install ninja install
}

package_libgflow-git() {
  depends=('glib2')
  provides=('libgflow')
  conflicts=('libgflow')

  _name=gflow
  _title=GFlow
  _version=1.0

  cd fake-install
  install -Dm644 usr/include/$_name-$_version/$_name-$_version.h "$pkgdir"/usr/include/$_name-$_version/$_name-$_version.h
  install -Dm755 usr/lib/lib$_name-$_version.so "$pkgdir"/usr/lib/lib$_name-$_version.so
  install -Dm644 usr/lib/pkgconfig/$_name-$_version.pc "$pkgdir"/usr/lib/pkgconfig/$_name-$_version.pc
  install -Dm644 usr/lib/girepository-1.0/$_title-$_version.typelib "$pkgdir"/usr/lib/girepository-1.0/$_title-$_version.typelib
  install -Dm644 usr/share/gir-1.0/$_title-$_version.gir "$pkgdir"/usr/share/gir-1.0/$_title-$_version.gir
  install -Dm644 usr/share/vala/vapi/$_name-$_version.deps "$pkgdir"/usr/share/vala/vapi/$_name-$_version.deps
  install -Dm644 usr/share/vala/vapi/$_name-$_version.vapi "$pkgdir"/usr/share/vala/vapi/$_name-$_version.vapi
}

package_libgtkflow3-git() {
  pkgdesc="Flowgraphs for GTK 3"
  depends=('libgflow-git' 'gtk3')
  provides=('libgtkflow' 'libgtkflow-git' 'libgtkflow3')
  conflicts=('libgtkflow' 'libgtkflow-git' 'libgtkflow3')
  replaces=('libgtkflow-git')

  _name=gtkflow3
  _title=GtkFlow3
  _version=1.0

  cd fake-install
  install -Dm644 usr/include/$_name-$_version/$_name-$_version.h "$pkgdir"/usr/include/$_name-$_version/$_name-$_version.h
  install -Dm755 usr/lib/lib$_name-$_version.so "$pkgdir"/usr/lib/lib$_name-$_version.so
  install -Dm644 usr/lib/pkgconfig/$_name-$_version.pc "$pkgdir"/usr/lib/pkgconfig/$_name-$_version.pc
  install -Dm644 usr/lib/girepository-1.0/$_title-$_version.typelib "$pkgdir"/usr/lib/girepository-1.0/$_title-$_version.typelib
  install -Dm644 usr/share/gir-1.0/$_title-$_version.gir "$pkgdir"/usr/share/gir-1.0/$_title-$_version.gir
  install -Dm644 usr/share/vala/vapi/$_name-$_version.deps "$pkgdir"/usr/share/vala/vapi/$_name-$_version.deps
  install -Dm644 usr/share/vala/vapi/$_name-$_version.vapi "$pkgdir"/usr/share/vala/vapi/$_name-$_version.vapi
}

package_libgtkflow4-git() {
  pkgdesc="Flowgraphs for GTK 4"
  depends=('libgflow-git' 'gtk4')
  provides=('libgtkflow4')
  conflicts=('libgtkflow4')

  _name=gtkflow4
  _title=GtkFlow4
  _version=0.2

  cd fake-install
  install -Dm644 usr/include/$_name-$_version/$_name-$_version.h "$pkgdir"/usr/include/$_name-$_version/$_name-$_version.h
  install -Dm755 usr/lib/lib$_name-$_version.so "$pkgdir"/usr/lib/lib$_name-$_version.so
  install -Dm644 usr/lib/pkgconfig/$_name-$_version.pc "$pkgdir"/usr/lib/pkgconfig/$_name-$_version.pc
  install -Dm644 usr/lib/girepository-1.0/$_title-$_version.typelib "$pkgdir"/usr/lib/girepository-1.0/$_title-$_version.typelib
  install -Dm644 usr/share/gir-1.0/$_title-$_version.gir "$pkgdir"/usr/share/gir-1.0/$_title-$_version.gir
  install -Dm644 usr/share/vala/vapi/$_name-$_version.deps "$pkgdir"/usr/share/vala/vapi/$_name-$_version.deps
  install -Dm644 usr/share/vala/vapi/$_name-$_version.vapi "$pkgdir"/usr/share/vala/vapi/$_name-$_version.vapi
}

# vim:set ts=2 sw=2 et:
