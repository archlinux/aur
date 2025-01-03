# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=confy
pkgver=0.8.0
pkgrel=2
pkgdesc="Conferences schedule viewer for GNOME"
arch=('x86_64' 'aarch64')
url="https://confy.kirgroup.net/"
license=(GPL3)
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'python-icalendar' 'libnotify')
makedepends=('meson' 'ninja' 'blueprint-compiler' 'gobject-introspection' 'git')
provides=(confy)
source=("https://git.sr.ht/~fabrixxm/confy/archive/$pkgver.tar.gz")
sha256sums=('98f46586f8020353a3673f31d49af14c97c359b390ddb9879090517eae4819d2')

build() {
  arch-meson --reconfigure build "$pkgname-$pkgver"
  ninja -C build
}

check() {
  cd "${srcdir}/build"
  ninja test
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" ninja install
}
