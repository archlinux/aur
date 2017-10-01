# Maintainer: Gordon Schulz <gordon.schulz@gmail.com>

pkgname=physlock-git
_pkgname='physlock'
pkgver=v11.r16.g4f131cc
pkgrel=1
pkgdesc="lightweight linux console locking tool"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/muennich/physlock"
depends=(pam)
makedepends=('git')
conflicts=('physlock')
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

build() {
  cd "${_pkgname}"
  make PREFIX="/usr"
}

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

