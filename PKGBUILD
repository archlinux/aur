# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>

pkgbasename='robofab'
pkgname=('python2-'$pkgbasename'-git')
pkgver=r319.62229c4
pkgrel=1
pkgdesc=""
arch=('any')
url="http://robofab.com/"
license=('custom:BSD')
makedepends=('git')
depends=('python2' 'python2-numpy' 'python2-fonttools')
source=("$pkgbasename::git+https://github.com/robofab-developers/$pkgbasename.git")
sha256sums=('SKIP')

package() {
  depends=('python2-setuptools')

  cd "$srcdir/"$pkgbasename
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$srcdir/$pkgbasename"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
