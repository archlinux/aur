# Maintainer: Magrid0 <magrid0 at proton dot me>
pkgname=embellish-git
pkgver=0.6.0.r0.g8ee3126
pkgrel=1
pkgdesc="User-friendly GUI application to install Nerd Fonts"
arch=('x86_64')
url="https://github.com/getnf/embellish"
license=('GPL-3.0-only')
depends=('gjs' 'libadwaita' 'gtk4' 'appstream')
makedepends=('meson' 'ninja' 'gobject-introspection' 'typescript' 'git')
provides=('embellish')
conflicts=('embellish')
source=("git+https://github.com/getnf/embellish.git")
sha256sums=('SKIP')

pkgver() {
  cd embellish
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  arch-meson embellish build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
