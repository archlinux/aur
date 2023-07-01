# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkg="blueprint-compiler"
_pkgname="${_pkg}-health"
pkgname="${_pkgname}-git"
pkgver=0.8.1
pkgrel=1
_ns=jwestman
pkgdesc='A markup language for GTK user interfaces'
url="https://${_ns}.pages.gitlab.gnome.org/${_pkg}"
license=(LGPL)
arch=(any)
depends=(
  python-gobject
)
makedepends=(
  meson
)
_commit="87cedc2c7e"
_repo_url="https://gitlab.gnome.org/${_ns}/${_pkg}"
source=(
  "git+${_repo_url}#commit=${_commit}")
sha256sums=(
  'SKIP')

build() {
  arch-meson "${_pkg}" build --prefix=/usr
  meson compile -C build
}

package() {
  provides=("${_pkg}=${pkgver}")
  conflicts=("${_pkg}")
  meson install -C build --destdir "${pkgdir}"
}
