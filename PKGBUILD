# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
pkgname=libqmi-dev
pkgver=1.37.995_dev
_commit=21b132657584532e9e34d8c5fedc46709c10f4b5
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
b2sums=('f4a345ad36eb62a936843a00c4078d89eb4c3ca2f232b3ed68410d02394b85a93dee3c362d15f819294c18b90a35c0a33069cce34252ce92db12520cfc2d93a7')
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
