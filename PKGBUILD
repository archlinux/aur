# Maintainer: taoky <me@taoky.moe>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# (This PKGBUILD is modified from that of libdecor in official repoistory.)
pkgdesc='Client-side decorations library for Wayland clients'
pkgname=libdecor-git
_pkgname=libdecor
pkgver=0.2.0
pkgrel=1
url="https://gitlab.freedesktop.org/libdecor/libdecor"
license=('MIT')
arch=('x86_64')
depends=('wayland' 'pango' 'dbus' 'egl-wayland' 'libxkbcommon' 'gtk3')
makedepends=('cmake' 'ninja' 'meson' 'wayland-protocols' 'git')
source=("git+https://gitlab.freedesktop.org/libdecor/libdecor.git")
sha512sums=('SKIP')
conflicts=('libdecor')
provides=('libdecor')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build () {
  rm -rf _build
  arch-meson _build "${_pkgname}"
  meson compile -C _build
}

check () {
  meson test -C _build
}

package () {
  meson install -C _build --destdir "${pkgdir}"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

