# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Max a.k.a. Synthead <synthead@gmail.com>
# Contributor: christhemonkey <christhemonkey at gmail dot com>

pkgname="raul"
pkgver=2.0.1
_commit="9cf7d1b3ca055fcfadc34bd269ef5f7227e155d8" # 2.0.1
pkgrel=1
pkgdesc="A header-only C++ real-time audio utility library"
arch=('any')
url="https://drobilla.net/software/raul.html"
_url="https://gitlab.com/drobilla/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('meson>=0.49.2')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_commit}.tar.gz")
b2sums=('ec17c41e50fd5ac2fca58ce1f3e8e3f1e5460ab562564909a35454a687aea39a5432257696ab9e798da0814242ccaf2b0d84679d205ff6117c8318e7b3e538e5')
# validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
  cd "${srcdir}"
  local meson_options=(
    -D tests=disabled
  )
  arch-meson "${_pkgsrc}" build "${meson_options[@]}"
  meson compile -C build
}

# check() {
#   cd "${srcdir}"
#   meson test -C build --print-errorlogs
# }

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
