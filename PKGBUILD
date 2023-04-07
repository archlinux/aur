# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-nspektr
pkgver=0.4.0
pkgrel=3
pkgdesc="A distribution package dependency inspector"
arch=('any')
url="https://github.com/jaraco/nspektr"
license=('MIT')
depends=('python-jaraco.context' 'python-jaraco.functools' 'python-more-itertools'
         'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest-enabler' 'python-pytest-mypy')
source=("https://github.com/jaraco/nspektr/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b29969de2a4975d154c43fd09ae7aa439b7b64732d1ab1964658d8ce9f8359ee')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd nspektr-$pkgver
  python -m build -wn
}

check() {
  cd nspektr-$pkgver
  python -m pytest
}

package() {
  cd nspektr-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
