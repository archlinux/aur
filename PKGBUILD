# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>

pkgname=pol-git
_pkgname=poline
pkgver=r112.1c5aef5
pkgrel=1
pkgdesc='Awk-like one-liners for Python'
arch=('any')
url="https://github.com/riolet/poline"
license=('MIT')
depends=('python' 'python-setuptools')
makedepends=('git')
options=(!emptydirs)
source=("$_pkgname::git+https://github.com/riolet/poline.git")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
