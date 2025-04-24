# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=adw-gtk-theme-git
_pkgname=adw-gtk3
pkgver=5.10.r2.g5962743
pkgrel=1
pkgdesc="The theme from libadwaita ported to GTK-3"
arch=('any')
url="https://github.com/lassekongo83/adw-gtk3"
license=('LGPL-2.1-or-later')
makedepends=(
  'dart-sass'
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${_pkgname}")
source=('git+https://github.com/lassekongo83/adw-gtk3.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
