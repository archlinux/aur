# Maintainer: Christopher Sculley <cs.sculley at gmail dot com>
pkgname=sleepplan-git
pkgver=r18.1af9c51
pkgrel=1
pkgdesc="Calculate times to wake up based on bedtimes, and vice versa."
arch=('any')
license=('GPL3')
url="https://gitlab.com/csculley/sleepplan"
depends=('python3')
makedepends=('git' 'python-setuptools')
provides=('sleepplan')
conflicts=('sleepplan')
source=("sleepplan::git+https://gitlab.com/csculley/sleepplan.git#branch=master")
md5sums=('SKIP')

pkgver() {
    mv sleeplan "$pkgname"
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir"
}
