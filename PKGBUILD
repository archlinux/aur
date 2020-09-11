pkgname=power-profiles-daemon
pkgver=0.1
pkgrel=1
pkgdesc="Makes power profiles handling available over D-Bus"
url="https://gitlab.freedesktop.org/hadess/power-profiles-daemon"
license=(GPL3)
arch=(x86_64)
depends=('libgudev' 'systemd')
makedepends=('git' 'meson')
_commit=dfeeebc9294b1ece5b0a1f797e4886b747640849
source=("git+https://gitlab.freedesktop.org/hadess/power-profiles-daemon.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
