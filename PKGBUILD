# Maintainer: akasaka <vladkorotnev at gmail dot com>

_pkgname=mctrd
pkgname=${_pkgname}-git
provides=("${_pkgname}")
pkgver=r36.ef53b25
pkgrel=1
pkgdesc="Small tool for managing TRD and SCL disk images"
arch=('x86_64')
license=('GPL-2.0')
url="https://github.com/samstyle/mctrd"
depends=()
makedepends=('git' 'make' 'gcc')
source=('git+https://github.com/samstyle/mctrd.git')
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  make
}

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/mctrd/mctrd" "${pkgdir}/usr/bin/mctrd"
  chmod +x "${pkgdir}/usr/bin/mctrd"
}
