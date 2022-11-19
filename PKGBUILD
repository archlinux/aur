# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-path
pkgver=16.5.0
pkgrel=1
pkgdesc='A module wrapper for os.path'
arch=('any')
license=('MIT')
url='https://github.com/jaraco/path'
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest-enabler' 'python38-pytest-mypy')
replaces=('python38-path.py')
conflicts=('python38-path.py')
provides=('python38-path.py')
source=("https://github.com/jaraco/path/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0b9b306b2b5cce1e51d65a7555e54770e19a3d4796dbaf2d617bbe8282c771e3d7975112e443462e9b43bafc533d6dc61bedb8608b0d93cc0d1febec995d1780')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd path-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd path-$pkgver
  python3.8 -m pytest
}

package() {
  cd path-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
