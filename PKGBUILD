# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=daikhan-git
pkgver=r615.13c3260
pkgrel=1
pkgdesc="A media player for the modern desktop"
arch=('x86_64')
url="https://gitlab.com/daikhan/daikhan"
license=('GPL-3.0-or-later')
depends=('gst-plugin-gtk4' 'libadwaita' 'xxhash')
makedepends=('blueprint-compiler' 'git' 'meson' 'vala')
checkdepends=('appstream')
provides=("${pkgname%-git}")
source=('git+https://gitlab.com/daikhan/daikhan.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
