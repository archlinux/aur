# Maintainer: Fernando Fernández <fernando@softwareperonista.com.ar>
_pkgname=gvls
pkgname=${_pkgname}-git
pkgver=0.10.2+42+g065a4bc
pkgrel=2
pkgdesc='GNOME Vala Language Server'
arch=(i686 x86_64)
url='https://gitlab.gnome.org/esodan/gvls'
license=(LGPL3)
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=(vala libgee libpeas gtksourceview3 gtksourceview4 jsonrpc-glib)
makedepends=(git meson)
optdepends=()
groups=()
source=("git+https://gitlab.gnome.org/esodan/gvls.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags  | sed 's/^gvls-//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson ${_pkgname} build

  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
