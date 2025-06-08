# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
pkgname=libmbim-dev
pkgver=1.33.1_dev
epoch=1
_commit=e10df4b6b3edfe6a46d93f7f5f5cab31c29a7091
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
b2sums=('d45ab07a908c2a0387ac91d7cc79e200330fd98d79c88800f584085fa074badc9526a6cd3b142f3c115a602512c371b3a6b925f70cd160792dd7c2e218b81844')
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
