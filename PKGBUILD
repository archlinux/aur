# Maintainer: Tim van Leuverden <timmy1e at protonmail dot ch>

pkgname=macro11-git

pkgver=macro11.2013.2.r6.ge35df87

pkgrel=1

pkgdesc="A MACRO-11 assembler for the PDP-11 in portable C source code."

arch=(any)

url="https://github.com/shattered/macro11"

license=('custom')

source=(${pkgname}::"git+https://github.com/shattered/${pkgname%-git}.git")

sha256sums=('SKIP')

depends=(
  "glibc"
)

makedepends=(
  "git"
  "make"
  "gcc"
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}/macro11" "${pkgdir}/usr/bin/macro11"
  install -D -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: sw=2 ts=2 tw=80 et:
