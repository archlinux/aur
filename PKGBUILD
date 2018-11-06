# Maintainer: Victor Roest <victor@xirion.net>
pkgname=dice-roller-git
pkgver=v1.9.r0.g8f0ed5a
pkgrel=2
pkgdesc="A python dice rolling application using the standard dice notation"
url="https://gitlab.xirion.net/vroest/dice-roller"
license=('GPL3')
depends=('python')
makedepends=('git' 'python')
arch=('i686' 'x86_64')
provides=('dice-roller')
source=(git+https://gitlab.xirion.net/vroest/dice-roller.git)
sha256sums=('SKIP')

pkgver() {
  cd "dice-roller"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$srcdir/dice-roller"
    python setup.py install --root="$pkgdir" --optimize=1
}
