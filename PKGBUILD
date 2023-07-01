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
sha512sums=(
  '19104642fd397b664ff08c513b2f9008d96f9da7665fb6552c0f866fe45685fd778f315ade2bc0dacd2616bbec0b0a032f4d1fe17632f8de97780869fe9e1a8c'
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
