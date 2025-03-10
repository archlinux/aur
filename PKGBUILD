# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=walbottle-git
pkgver=0.2.0.r71.ge643df3
pkgrel=3
pkgdesc="A project for generating JSON unit test vectors from JSON Schemas."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/walbottle/walbottle"
license=('LGPL-2.1-or-later')
depends=('json-glib')
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
)
provides=("${pkgname%-git}" 'libwalbottle-0.so')
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/walbottle/walbottle.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
