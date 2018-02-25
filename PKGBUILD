# Maintainer: Christopher Sculley <cs.sculley@gmail.com>
pkgname=gitlpm-git
pkgver=r8.fc562d0
pkgrel=1
pkgdesc="Graphs your lpm (lines per minute) between commits"
arch=('any')
license=('GPL3')
url="https://github.com/csculley/gitlpm.git"
depends=('python' 'gawk' 'gnuplot')
makedepends=('git')
provides=('gitlpm')
conflicts=('gitlpm')
source=('gitlpm::git+https://github.com/csculley/gitlpm.git#branch=master')
md5sums=('SKIP')

pkgver() {
    mv gitlpm "$pkgname"
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir"/usr/bin
    mv gitlpm.py gitlpm
	chmod +x gitlpm
    cp gitlpm "$pkgdir"/usr/bin
}
