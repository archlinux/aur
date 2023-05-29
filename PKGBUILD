# Maintainer: Andrew Scott <aur at andyscott dot me>
_pkgname=check-link-consistency
pkgname="${_pkgname}-git"
pkgver=r29.6a0e048
pkgrel=1
pkgdesc="Checks linked files like revdep-rebuild with additional features for Arch Linux"
arch=('x86_64')
url='https://github.com/dimgel/check-link-consistency'
license=('GPL3')
depends=('libarchive' 'libelf')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/dimgel/"${_pkgname}".git)
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
