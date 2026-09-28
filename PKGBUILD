# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-diffpy.structure
pkgshort=diffpy.structure
pkgver=3.5.0
pkgrel=1
pkgdesc="Storage and manipulation of crystal structure data in python"
arch=('any')
url="https://www.diffpy.org/diffpy.structure/"
license=('BSD-3-Clause')

depends=('python<3.15'
         'python-numpy'
         'python-pycifrw'
         )

makedepends=('python-setuptools>=62.0'
             'python-setuptools-git-versioning>=2.0'
             'python-wheel'
             'python-build'
             'python-installer'
             )

provides=('diffpy.structure')

source=(https://github.com/diffpy/diffpy.structure/archive/$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname
}

sha256sums=('a46159361fd9ba9ce743f177532b217ffe65dbe198a231e2a092bd6e78454fb9')
