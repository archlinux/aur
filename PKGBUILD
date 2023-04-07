# Maintainer: David Runge <dvzrv@archlinux.org>

_name=deepmerge
pkgname=python-deepmerge
pkgver=1.1.0
pkgrel=2
pkgdesc="A deep merging tool for Python core data structures"
arch=(any)
url="https://github.com/toumorokoshi/deepmerge"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-toml python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('9facde604ee02271ad49d9a14e88fa23690c41728c3c350594533725c2e38803cc75f9345ff19bb63ceb318ea7c58a46ed0d6091682560509401206c8b4e8537')
b2sums=('747fc6c553c5a3b9ddcef77556004456980da91168e198b063444961e4d545828833c43d15b5ec3811539a05a528c90d2e7efb16842603642264286dffede000')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
