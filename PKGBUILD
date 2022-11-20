# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-apipkg
pkgver=3.0.1
pkgrel=1
pkgdesc="Namespace control and lazy-import mechanism"
arch=('any')
license=('MIT')
url="https://github.com/pytest-dev/apipkg"
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-hatchling' 'python38-hatch-vcs')
checkdepends=('python38-pytest-runner')
source=("https://github.com/pytest-dev/apipkg/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('89251f02a49b5191879bcf6e35c6a8755d6b29f1ca1c6061eab004385b11433ec86e2968ab23994c6a74515d6a673e445b3bcf8cbdd21b2ec644fcef0d19b419')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  cd apipkg-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd apipkg-$pkgver
  PYTHONPATH="$PWD"/src pytest
}

package() {
  cd apipkg-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
