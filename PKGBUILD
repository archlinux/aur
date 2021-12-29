# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=confy
pkgver=0.6.3
pkgrel=1
pkgdesc="Conferences schedule viewer for GNOME"
arch=('x86_64' 'aarch64')
url="https://confy.kirgroup.net/"
license=(GPL3)
depends=('python' 'gtk3' 'libhandy' 'python-gobject' 'python-icalendar' 'libnotify')
makedepends=('meson' 'ninja' 'gobject-introspection' 'git')
provides=(confy)
source=("https://git.sr.ht/~fabrixxm/confy/archive/$pkgver.tar.gz")
md5sums=('a6b22451e00d9e7e2d40bb3a62e8d402')


build() {
  arch-meson build "$pkgname-$pkgver"
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
