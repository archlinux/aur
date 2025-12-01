# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=confy
pkgver=0.9.0
pkgrel=1
pkgdesc="Conferences schedule viewer for GNOME"
arch=('x86_64' 'aarch64')
url="https://confy.kirgroup.net/"
license=(GPL3)
depends=('python' 'gtk4' 'libadwaita' 'python-gobject' 'python-icalendar' 'libnotify')
makedepends=('meson' 'ninja' 'blueprint-compiler' 'gobject-introspection' 'git')
provides=(confy)
source=("https://git.sr.ht/~fabrixxm/confy/archive/$pkgver.tar.gz")
sha256sums=('4b75a830708b049de526bba503b94c35497953e3ac7e42bed6bee7867fae9a77')

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
