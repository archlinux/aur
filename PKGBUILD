# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=blanket-git
pkgver=0.7.0.r106.g2dfa3d3
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
arch=('any')
url="https://apps.gnome.org/Blanket"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugins-bad-libs'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-python'
  'libadwaita'
  'python-gobject'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/rafaelmardojai/blanket.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
