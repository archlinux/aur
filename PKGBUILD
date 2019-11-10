# Maintainer: Fernando Fernández <fernando@softwareperonista.com.ar>
_pkgname=gvls
pkgname=${_pkgname}-git
pkgver=0.10.2+93+g36789fd
pkgrel=1
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
source=("git+https://gitlab.gnome.org/esodan/gvls.git"
        "fix-valadoc-icon-dir.patch")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}

  git describe --tags  | sed 's/^gvls-//;s/_/./g;s/-/+/g'
}

prepare() {
  cd ${_pkgname}

# patch -Np1 -i ../
}

build() {
  arch-meson --wrap-mode=nofallback ${_pkgname} build \
             -Ddisable-valadocs=false \

  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
