# Maintainer: Kyle Manna <kyle at kyle manna dot com>

pkgname='bmaptool'
replaces=('bmap-tools')
pkgver=3.9.0
pkgrel=2
pkgdesc="Tool optimized for copying largely sparse files using information from a block map (bmap) file"
arch=('any')
url='https://github.com/yoctoproject/bmaptool'
license=('GPL2')
depends=('python3' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-hatchling' 'python-wheel')
source=("https://github.com/yoctoproject/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9940bb97fa0f2c11ee4625a2f620a4ae2b94c556f8d01c070aee08486a2a1812')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 docs/man1/bmaptool.1 "$pkgdir"/usr/share/man/man1/bmaptool.1
}

# vim:set ts=2 sw=2 et:
