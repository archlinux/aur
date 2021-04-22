pkgname=python-asciitree-git
pkgver=r48.29712fb
pkgrel=1
pkgdesc="draws tree structures using characters."
arch=('any')
url="https://github.com/mbr/asciitree"
license=('MIT')
provides=('python-asciitree')
conflicts=('python-asciitree')
depends=('python')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/mbr/asciitree.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}