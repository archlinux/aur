# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Mark Wagie (yochananmarqos) <mark.wagie@proton.me>
# Contributor: Fabio Loli (fabiololix) <fabio.loli@disroot.org>

_pkgname=gedit
pkgname="lib${_pkgname}-gtksourceview"
pkgver=299.0.3
pkgrel=1
_pkgdesc=("A library that extends GtkTextView, the standard GTK "
          "widget for multiline text editing.")
pkgdesc="${_pkgdesc[@]}"
arch=(x86_64)
url="https://${_pkgname}-technology.net"
license=(LGPL2.1)
depends=(
  'gtk3'
  'libxml2'
)
makedepends=(
  'gobject-introspection'
  'gtk-doc'
  'meson'
)
checkdepends=(
  'xorg-server-xvfb'
)
provides=(
  "${pkgname}-300.so"
)
_github_repo="https://github.com/${_pkgname}-technology/${pkgname}"
_github_tarball="${_github_url}/archive/refs/tags/${pkgver}.tar.gz"
_tarball="${url}/tarballs/${pkgname}/${pkgname}-${pkgver}.tar.xz"
source=(
  "${pkgname}-${pkgver}.tar.xz::${url}/tarballs/${pkgname}/${pkgname}-${pkgver}.tar.xz"
  # "${pkgname}-${pkgver}.tar.gz::${_github_tarball}"
)
sha256sums=(
  # '68b7825d4577cfb94bd688364cfa581e441eccd8e7f73769648be4f69ae5c06a'
  'd80ec2afe87be45eadfff9396814545be15ac32e16f67fd07480e69c100c8659'
)

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  export NO_AT_BRIDGE=1
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
