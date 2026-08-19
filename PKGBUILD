# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=confy
pkgver=0.9.1
pkgrel=1
pkgdesc="Conferences schedule viewer for GNOME"
arch=('x86_64' 'aarch64')
url="https://confy.kirgroup.net/"
license=(GPL3)
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'python-icalendar' 'libnotify')
makedepends=('meson' 'ninja' 'blueprint-compiler' 'gobject-introspection' 'git')
provides=(confy)
source=("https://git.sr.ht/~fabrixxm/confy/archive/$pkgver.tar.gz")
sha256sums=('3ed1a8cd947c65f6b25e760b3f49bd8f61108a5f3d6e82628443adee792e33c7')

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
