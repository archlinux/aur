# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
pkgname=libqmi-dev
pkgver=1.37.1_dev
_commit=f94755fec4b8b3dfc2d66df647844518025365a8
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
b2sums=('bbcd5e66076340c7503631698617345dff6211afdff8ca5be4bf8190aafb153cc6a06881f90185367207c4d4377c8031ec8f291792f08b92d2a7d2888af11a35')
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
