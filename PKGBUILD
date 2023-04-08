# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=organizer-git
pkgver=0.201.r0.g87e988e
pkgrel=4
pkgdesc="Python GTK app to organize your files"
arch=('any')
url="https://gitlab.gnome.org/aviwad/organizer"
license=('GPL3')
depends=('gtk3' 'libhandy0' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/aviwad/organizer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
