# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Triss Healy (trissylegs) <th at trissyle dot gs>
pkgname=libshumate-git
pkgver=1.0.0.beta.r6.g125757b
pkgrel=1
pkgdesc="GTK toolkit providing widgets for embedded maps"
arch=('x86_64' 'aarch64')
url="https://wiki.gnome.org/Projects/libshumate"
license=('LGPL')
depends=('gtk4' 'libsoup3' 'sqlite')
makedepends=('gi-docgen' 'git' 'gobject-introspection' 'gtk-doc' 'meson' 'vala')
provides=("${pkgname%-git}" "${pkgname%-git}-1.0.so=1")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/GNOME/libshumate.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
