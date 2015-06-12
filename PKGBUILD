# Maintainer: Michael Schubert <mschu.dev@gmail>

pkgname=scikits-bootstrap-git
pkgver=r34.1d785c7
pkgrel=1
pkgdesc="Bootstrap confidence interval estimation"
arch=('any')
url="https://github.com/cgevans/scikits-bootstrap"
license=('BSD')
depends=('python2-distribute')
optdepends=('python2-scipy')
makedepends=('git')
source=($pkgname::git+https://github.com/cgevans/scikits-bootstrap.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build()
{
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
} 
