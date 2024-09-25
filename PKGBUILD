# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

_pkgname=frog-protocols
pkgname=frog-protocols-git
pkgver=0.01.r4.g17be81d
pkgrel=1
pkgdesc="Frog protocols for Wayland 🐸 (Git version)"
arch=('any')
url="https://github.com/misyltoad/${_pkgname}"
license=('MIT')
makedepends=('git' 'meson')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname}" build

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  # Install the license
  install -Dm644 "${_pkgname}"/LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.md
}
