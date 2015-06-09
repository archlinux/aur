# Maintainer: proudzhu <proudzhu at gmail.com>

pkgname=python-eg-git
_pkgname=python-eg
pkgver=0.0.3.r31.gb844e37
pkgrel=1
pkgdesc="Useful examples at the command line."
arch=('any')
url="https://github.com/srsudar/eg"
license=('GPL')
depends=('python')
makedepends=('git')
provides=('python-eg')
conflicts=('python-eg')
options=(!emptydirs)
source=("$_pkgname::git+https://github.com/srsudar/eg.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
