# Contributor: envolution
# Contributor:  Mateusz Ziemła <mtizim+aur@pm.me>
# Contributor: Jaroslv Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: tee < teeaur at duck dot com >
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gdmap
pkgver=1.4.0
_debver=${pkgver/+/-}
_origver=${pkgver%%+*}
pkgrel=1
pkgdesc="Tool to inspect the used space of folders"
arch=(x86_64)
url='https://gitlab.com/sjohannes/gdmap'
license=(GPL-2.0-or-later)
depends=(libxml2 glibc cairo glib2 gdk-pixbuf2 gtk3)
makedepends=('meson' 'ninja' 'gettext')
source=("$url/-/archive/v$pkgver/gdmap-v$pkgver.tar.gz")
b2sums=('033472fde37e4287bdb7d182e79cac7813b532dfa387f4c868a28edcd74c17c12351b3a093c1c020ddceeeb9c46991aec5117462f5abfb10ee35f8aed59ab1d7')

prepare() {
  cd "${pkgname}-v${_origver}"
}
build() {
  cd "${pkgname}-v${_origver}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}-v${_origver}"
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 LICENSES/GPL-2.0.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
# vim:set ts=2 sw=2 et:
