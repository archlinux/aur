# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-nspektr
pkgver=0.3.0
pkgrel=2
pkgdesc="A distribution package dependency inspector"
arch=('any')
url="https://github.com/jaraco/nspektr"
license=('MIT')
depends=('python-jaraco.context' 'python-jaraco.functools' 'python-more-itertools'
         'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest-black' 'python-pytest-checkdocs' 'python-pytest-cov'
              'python-pytest-enabler' 'python-pytest-flake8' 'python-pytest-mypy'
              'python-pip')
source=("https://github.com/jaraco/nspektr/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fdcf6db3d7cc611bff70ae789e0be32a8dfa52e26efc0b8486a1e78a3cc2a74d')

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
