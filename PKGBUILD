# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
pkgname=libmbim-dev
pkgver=1.35.95_dev
_commit=c491dbae17281e32ee781d5c588fef932e29cc12
pkgrel=1
pkgdesc="MBIM modem protocol helper library"
url="https://www.freedesktop.org/wiki/Software/libmbim/"
arch=(x86_64)
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
  bash
  glib2
  systemd
)
makedepends=(
  bash-completion
  git
  gobject-introspection
  help2man
  meson
)
provides=(libmbim libmbim-glib.so)
conflicts=(libmbim)
source=(git+https://gitlab.freedesktop.org/mobile-broadband/libmbim.git#commit=$_commit)
b2sums=('2974348a5beed7b344826e49c582e2707649f331553f323bb2bb49e1149c335148ffb7f35ecfe66b730f1b72316c90729f80bd70e4d4c0d2a15def4512b39218')
validpgpkeys=(
  A814D09B9C5BC01945A64308AECE0239C6606AD5 # Aleksander Morgado <aleksandermj@chromium.org>
)

build() {
  local meson_options=(
    -D gtk_doc=false
  )

  arch-meson libmbim build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
