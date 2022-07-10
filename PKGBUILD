# Maintainer: xeruf <27jf at pm dot me>

_pkgname='instalee'
pkgname="${_pkgname}-git"
pkgver=r30.7c6fa3f
pkgrel=1
pkgdesc='TODO'
arch=('any')
url="https://github.com/xeruf/${_pkgname}"
license=(GPL)
depends=()
provides=("${_pkgname}")
conflicts=()
optdepends=()
source=("git+${url}")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}/"
  local bin="${pkgdir}/usr/bin"
  install -D --target-directory "$bin" "${_pkgname}"
  sed -i "s/r%s.%s/version ${pkgver}/" "$bin/${_pkgname}"
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
