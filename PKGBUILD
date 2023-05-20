# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
_name=escambo
pkgname=$_name-git
pkgver=0.1.0.r154.5aa141f
pkgrel=1
pkgdesc="HTTP-based APIs test application"
arch=(any)
url="https://github.com/CleoMenezesJr/escambo"
license=(GPL3)
depends=(libadwaita python-gobject python-requests)
makedepends=(blueprint-compiler meson git)
checkdepends=(appstream-glib)
provides=($_name)
conflicts=($_name)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd $_name
    _ver=$(grep ' version:' meson.build | cut -d\' -f2)
    printf "${_ver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_name
}

build() {
  arch-meson $_name build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  meson install -C build --destdir="$pkgdir"
}
