# Maintainer: Tim van Leuverden <timmy1e at protonmail dot ch>

pkgname=macro11-git

pkgver=r13.5f553d7

pkgrel=1

pkgdesc="A PDP-11 cross assembler in portable C source code."

arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')

url="https://github.com/j-hoppe/MACRO11"

license=('MIT')

source=(${pkgname}::"git+https://github.com/j-hoppe/MACRO11.git")

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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/src"
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}/src/macro11" "${pkgdir}/usr/bin/macro11"
  install -D -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: sw=2 ts=2 tw=80 et:
