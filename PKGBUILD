# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Max a.k.a. Synthead <synthead@gmail.com>
# Contributor: christhemonkey <christhemonkey at gmail dot com>

pkgname="raul"
pkgver=2.0.0
pkgrel=1
pkgdesc="A header-only C++ real-time audio utility library"
arch=('any')
url="https://drobilla.net/software/raul.html"
license=('GPL-3.0-or-later')
makedepends=('meson>=0.49.2')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.drobilla.net/${_pkgsrc}.tar.xz"
        "${_pkgsrc}.tar.xz.sig::https://download.drobilla.net/${_pkgsrc}.tar.xz.sig")
b2sums=('2fac6a15f1419652bc537a2450e358565b48510dcbc4b9e5e514dab5caeb03aafb35b49d35c4b0013512be5c004aba5a37158f98620d28b6fa5592693b7b076b'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

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
