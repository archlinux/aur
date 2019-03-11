# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cursewords-git
pkgver=1.0.3.r0.ed5f7d5
pkgrel=1
pkgdesc="Terminal-based crossword puzzle solver"
arch=('any')
url="https://github.com/thisisparker/cursewords"
license=('AGPL3')
depends=('python' 'python-blessed' 'python-puzpy')
makedepends=('git')
conflicts=('cursewords')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

build() {
  cd "${pkgname%-git}"

  python setup.py build
}

package() {
  cd "${pkgname%-git}"

  python setup.py install --prefix=/usr --root="$pkgdir"
}
