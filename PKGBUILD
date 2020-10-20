# Maintainer: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>
# Contributor: Michel Zou <xantares (at) archlinux (dot) org>

pkgname=python-pypotrace-git
pkgver=0.2.r2.g76c76be
pkgrel=1
pkgdesc="potrace Python bindings"
arch=('any')
url="https://pypi.org/project/pypotrace/"
license=('GPL')
makedepends=('python-setuptools' 'cython' 'git')
depends=('potrace' 'agg' 'python-numpy' 'python')

_name=${pkgname#python-}
source=("git+https://github.com/flupke/pypotrace.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/${_name%-git}"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
