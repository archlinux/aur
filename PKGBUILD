# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkg="blueprint-compiler"
_pkgname="${_pkg}-health"
pkgname="${_pkgname}-git"
_pkgver=0.8.1
_commit="87cedc2c7e48b01dc1b07aef937e2fe02111b18c"
pkgver="${_pkgver}+$(echo "${_commit}" | cut -c 1-8)"
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
  # git
  meson
)
_repo_url="https://gitlab.gnome.org/${_ns}/${_pkg}"
source=(
  # "git+${_repo_url}#commit=${_commit}")
  "${_repo_url}/-/archive/${_commit}/${_pkgname}-${_commit}.tar.gz"
)
sha512sums=(
  '0efab0dfed53715f856e9b933e7a9965d01e59c7f2152146a1294d02471d5d200020a0a8812bd4662be3438c5e8ba5b293ec1a6c0e47c4036b85d3024ef239e0')

build() {
  arch-meson "${_pkg}-${_commit}" build --prefix=/usr
  meson compile -C build
}

package() {
  provides=(
    "${_pkg}=${pkgver}"
    "${_pkgname}=${pkgver}"
  )
  conflicts=(
    "${_pkg}"
    "${_pkgname}")
  meson install -C build --destdir "${pkgdir}"
}
