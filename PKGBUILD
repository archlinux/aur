# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgname=myrowing
pkgname=${_pkgname}-git
_pkgorg=gitlab.com/${_pkgname} 
pkgver=v0.2.5.r11.g5d39600
pkgrel=1
pkgdesc="Analyze your rowing training data"          
arch=(any) 
url="https://${_pkgorg}/${_pkgname}"
license=(GPL3) 
source=("git+https://${_pkgorg}/${_pkgname}.git")
md5sums=(SKIP) 
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
makedepends=(
  git
  pwgen
) 
provides=(myrowing)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
 
build() {
  cd "${_pkgname}"
  make
} 
 
package() { 
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
} 
