# Maintainer: unknowndev (unknowndevQwQ at pm dot me)

_pkgname='youki'
pkgname="${_pkgname}-git"
pkgver=r507.5bc0778
pkgrel=1
pkgdesc="A container runtime written in rust"
arch=('x86_64')
url='https://github.com/containers/youki'
license=('MIT')
sha256sums=('SKIP')
source=("git+${url}")
provides=('youki')
makedepends=('git' 'dbus-glib' 'pkg-config' 'systemd')

pkgver() {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./build.sh
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm0644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
