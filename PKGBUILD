# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgbasename='trufont'
pkgname=($pkgbasename'-git')
pkgver=r321.2ae3efc
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/trufont/trufont"
license=('GPL3' 'LGPL2.1')
makedepends=('git')
depends=('python-defcon-git' 'python-robofab-git')
source=("git+https://github.com/trufont/trufont.git")
sha256sums=('SKIP')

package() {
  depends=('python-setuptools')

  cd "$srcdir/$pkgbasename"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$srcdir/$pkgbasename"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
