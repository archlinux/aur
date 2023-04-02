# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=blanket-git
pkgver=0.6.0.r42.ge2cded9
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
arch=('any')
url="https://apps.gnome.org/app/com.rafaelmardojai.Blanket"
license=('GPL3')
depends=('gst-plugins-bad-libs' 'gst-plugins-base' 'gst-plugins-good' 'gst-python'
         'libadwaita' 'python-gobject')
makedepends=('meson' 'git')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/rafaelmardojai/blanket.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
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
