# Maintainer: James An <james@jamesan.ca>
_pkgname=creepy
pkgname=python2-$_pkgname-git
pkgver=r17.e051e44
pkgrel=1
pkgdesc="Dead simple web crawler for Python"
arch=('any')
url="https://github.com/Aitjcize/$_pkgname"
license=('GPL')
depends=('python2')
makedepends=('git')
options=(!emptydirs)
source=("$_pkgname::git+https://github.com/aitjcize/$_pkgname.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
