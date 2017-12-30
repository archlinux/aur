# Maintainer: Christopher Sculley <cs.sculley@gmail.com>
pkgname=sleepplan-git
pkgver=r16.4fe2ec9
pkgrel=1
pkgdesc="Calculate times to wake up based on bedtimes, and vice versa."
arch=('any')
license=('GPL3')
url="https://github.com/csculley/sleepplan"
makedepends=('git')
provides=('sleepplan')
conflicts=('sleepplan')
source=('sleepplan::git+https://github.com/csculley/sleepplan.git#branch=master')
md5sums=('SKIP')

pkgver() {
    mv sleepplan "$pkgname"
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$pkgname"
    mkdir -p $pkgdir/usr/bin
    mv sleepplan.py sleepplan
	chmod +x sleepplan
    cp sleepplan $pkgdir/usr/bin
}
