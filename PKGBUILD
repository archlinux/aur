# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Anselmo L. S. Melo <anselmo.melo@intel.com>

pkgbasename='defcon'
pkgname="python-$pkgbasename-git"
pkgver=r273.bba773c
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/trufont/$pkgbasename"
license=('MIT')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/trufont/$pkgbasename.git")
sha256sums=('SKIP')

package() {
  cd "$pkgbasename"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$pkgbasename"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
