# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-jaraco.path
pkgver=3.4.0
pkgrel=3
pkgdesc="Miscellaneous path functions"
url="https://github.com/jaraco/jaraco.path"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest-enabler' 'python38-pytest-mypy')
source=("https://github.com/jaraco/jaraco.path/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a9d9cbb605584764ea7ea97a9c8d51a383cb18866787cc20bd08fb5fb2227ea05d8fbf0754d240821530dc493a80634810df1f8446454d5dcca3980eb6144483')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd jaraco.path-$pkgver
  python3.8 -m build -wn
}

check() {
  cd jaraco.path-$pkgver
  python3.8 -m pytest
}

package() {
  cd jaraco.path-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
