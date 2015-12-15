# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>

pkgbasename='robofab'
pkgname=('python-'$pkgbasename'-git')
pkgver=r441.f646d1f
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/trufont/"$pkgbasename
license=('custom:robofab')
makedepends=('git')
source=("git+https://github.com/trufont/"$pkgbasename".git")
sha256sums=('SKIP')

package() {
  depends=('python-setuptools')

  cd "$srcdir/"$pkgbasename
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$srcdir/$pkgbasename"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
