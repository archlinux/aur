# Maintainer: James An <james@jamesan.ca>
# Contributor: kozec <kozec at kozec dot com>

pkgname="leapcast-git"
_pkgname=${pkgname%-git}
pkgdesc="ChromeCast emulation app for any device"
pkgver=0.1.3.r10.g6142d0a
pkgrel=4
url="https://github.com/dz0ny/$_pkgname"
license=('MIT')
arch=('any')
depends=('python2-tornado' 'python2-requests' 'python2-setuptools')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/dz0ny/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
