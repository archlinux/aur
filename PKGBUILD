# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
pkgname=libmbim-dev
pkgver=1.31.6_dev
pkgrel=3
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
  gtk-doc
  help2man
  meson
)
provides=(libmbim libmbim-glib.so)
conflicts=(libmbim)
source=(git+https://gitlab.freedesktop.org/mobile-broadband/libmbim.git?signed#tag=${pkgver//_/-})
b2sums=('68ab782cd46bda626af3951a6acd6814b55c6640a7488b5b60666e842fdaf99153a4d56cda3b020b4ba039a2e0834e6f91cabb71ed16e2aa025b9baf00d515ff')
validpgpkeys=(
  A814D09B9C5BC01945A64308AECE0239C6606AD5 # Aleksander Morgado <aleksandermj@chromium.org>
)

build() {
  local meson_options=(
    -D gtk_doc=true
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
