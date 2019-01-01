# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=physlock-issue-git
_pkgname='physlock'
pkgver=v0.5.r58.gf9d9618
pkgrel=1
pkgdesc="lightweight linux console locking tool (with support for displaying /etc/issue)"
arch=('x86_64')
license=('GPL')
url="https://github.com/hv15/physlock"
depends=('pam')
makedepends=('git')
provides=('physlock')
conflicts=('physlock')
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  make PREFIX="/usr"
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

