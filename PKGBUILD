# Maintainer: Tom Vincent <aur@tlvince.com>
# Contributor: John Hamelink <me@johnhame.link>

_gitname=python-tidalapi
_gitbranch=0.6.x
pkgname="${_gitname}-${_gitbranch}-git"
pkgver=v0.6.8.r1.gd7a77f3
pkgrel=2
pkgdesc='Unofficial API for TIDAL music streaming service. 0.6.x Git branch for oAuth fix'
url=https://github.com/tamland/python-tidal
license=(LGPL3)
source=("git://github.com/tamland/python-tidal#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('any')
depends=('python' 'python-requests')
makedepends=('git')
conflicts=("${_gitname}")
provides=("${_gitname}")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
