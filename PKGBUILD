# Maintainer: ShinKouyo <i@0x0f.dev>

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=pins-git
_pkgname=Pins
pkgver=2.4.6.r4.gd1b7bac
pkgrel=1
pkgdesc="Create and edit app shortcuts"
arch=('x86_64')
url="https://github.com/fabrialberio/Pins"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja')
provides=('pins')
conflicts=('pins')
options=('!debug')
source=("Pins::git+https://github.com/fabrialberio/Pins.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit 1
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
