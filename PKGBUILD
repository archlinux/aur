# Maintainer: Wayne Campbell <wcampbell1995 [at] gmail [dot] com>
# Python package author: Michael Rooney <mrooney.mintapi@rowk.com>
pkgname=python-mintapi
_pkgname=mintapi
pkgver=r345.be14aac
pkgrel=1
pkgdesc="a screen-scraping API for Mint.com"
arch=(any)
url="https://github.com/mrooney/mintapi"
license=(The MIT License)
source=("git+https://github.com/mrooney/mintapi.git")
makedepends=("python")
md5sums=('SKIP')

# Support without tags and with tags
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$srcdir/${_pkgname}"
    sudo python setup.py install --root="$pkgdir" --optimize=1
}
