# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=pypi-simple-search
pkgname=pypi-simple-search-git
pkgrel=1
pkgver=r6.0fbc935
pkgdesc="A stop-gap replacement for pip search."
url=https://github.com/jeffmm/pypi-simple-search
arch=('any')
license=("unknown")
conflicts=(${_pkgbase})
depends=('python-pip')
makedepends=('git')
source=("git+https://github.com/jeffmm/pypi-simple-search.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd "${_pkgbase}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd ${srcdir}/${_pkgbase}
	install -dm755 ${pkgdir}/usr/bin
	make PREFIX=${pkgdir}/usr install
}
