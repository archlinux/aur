# Maintainer: Butter Cat <ButteredCats@protonmail.com>
# Contributor: Robin Appelman <robin@icewind.nl>

_pkgname="rapl-read-ryzen"
pkgname="${_pkgname}-git"
pkgver=r5.30636f0
pkgrel=1
pkgdesc="Quick and dirty hack to try to use the rapl counters on the AMD Ryzen platform."
arch=('any')
url="https://github.com/djselbeck/rapl-read-ryzen"
license=('GPL')
makedepends=('git' 'gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  gcc -o rapl ryzen.c -lm
}

package() {
  cd "${_pkgname}"
  install -D -m755 "rapl" "${pkgdir}/usr/bin/rapl"
}
