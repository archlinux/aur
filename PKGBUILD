# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname="blueprint-compiler"
pkgname="blueprint-compiler-health"
_commit="93f2a27e35905420e70bfdb5c2f04d6af43b357d"
_pkgver=0.8.1
pkgver="${_pkgver}+$(echo ${_commit} | cut -c 1-8)"
pkgrel=1
_ns=jwestman
pkgdesc='A markup language for GTK user interfaces'
url="https://${_ns}.pages.gitlab.gnome.org/${_pkgname}"
license=(LGPL)
arch=(any)
depends=(
  python-gobject
)
makedepends=(
  # git
  meson
)
_repo_url="https://gitlab.gnome.org/${_ns}/${_pkgname}"
source=(
  # "git+${_repo_url}#commit=${_commit}")
  "${_repo_url}/-/archive/${_commit}/${_pkgname}-${_commit}.tar.gz"
)
sha256sums=(
  'SKIP'
)

build() {
  arch-meson "${_pkgname}-${_commit}" build --prefix=/usr
  meson compile -C build
}

package() {
  provides=("${_pkgname}=${pkgver}")
  conflicts=("${_pkgname}")
  meson install -C build --destdir "${pkgdir}"
}
