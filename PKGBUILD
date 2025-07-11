# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
# Contributor: Philipp A. <flying-sheep@web.de>

_name=asciitree
pkgname=python-asciitree
pkgver=0.3.3
pkgrel=4
pkgdesc='Draws +-- ASCII Trees'
arch=('any')
url='http://github.com/mbr/asciitree'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e')

build() {
  python -m build -nw $_name-$pkgver
}

package() {
  cd "$_name-$pkgver"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    dist/${_name}-${pkgver}-*.whl
}
