pkgname=bitvalue-git
pkgver=r1.a9f0a83
pkgrel=1
pkgdesc="Simple bash script to visualize the value of your bitcoin investment."
arch=('any')
url="http://git.treefish.org/~alex/bitvalue.git"
license=('GPL3')
source=('bitvalue-git::git+https://git.treefish.org/~alex/bitvalue.git')
md5sums=('SKIP')
depends=('gnuplot>=5.2' 'wget>=1.19' 'bash>=4.4')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -Dm755 -t ${pkgdir}/usr/bin $srcdir/$pkgname/bitvalue
}
