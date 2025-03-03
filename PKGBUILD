# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
pkgname=libqmi-dev
pkgver=1.35.95_dev
_commit=affc3af83a8ceeb2f8462081b9d5fc39b0a7258d
pkgrel=1
pkgdesc="QMI modem protocol helper library"
url="https://www.freedesktop.org/wiki/Software/libqmi/"
arch=(x86_64)
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
  bash
  gcc-libs
  glib2
  glibc
  libgudev
  libmbim-dev
  libqrtr-glib
)
makedepends=(
  bash-completion
  git
  gobject-introspection
  help2man
  meson
)
source=(git+https://gitlab.freedesktop.org/mobile-broadband/libqmi.git#commit=$_commit)
b2sums=('02094636892305ef8de0514dd92a8cfc1dc6a51bc835080087fb200b935716062f25dedd4c257fc88591d8c9c0a39d62648f5a111a949f68ed3d23d14551d76e')
validpgpkeys=(
  A814D09B9C5BC01945A64308AECE0239C6606AD5 # Aleksander Morgado <aleksandermj@chromium.org>
)

build() {
  local meson_options=(
    -D gtk_doc=false
  )

  arch-meson libqmi build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs --no-rebuild
}

package_libqmi-dev() {
  provides=(libqmi libqmi-glib.so)
  conflicts=(libqmi)

  meson install -C build --destdir "$pkgdir" --no-rebuild
}

# vim:set sw=2 sts=-1 et:
