# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-jaraco.envs
pkgver=2.4.0
pkgrel=2
pkgdesc="Classes for orchestrating Python 3.8 (virtual) environments"
url="https://github.com/jaraco/jaraco.envs"
license=('MIT')
arch=('any')
depends=('python38-path' 'python38-virtualenv' 'python38-tox')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest-enabler' 'python38-pytest-mypy')
source=("https://github.com/jaraco/jaraco.envs/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('08610971183227ac92aafdb7dbf92c9045a0ccd20ed451fd36c9c71dc869a86559d75fdfc64de18a1f7a0ebef6666d66896eef162e9c8482203e75a9b2f0a1f6')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd jaraco.envs-$pkgver
  python3.8 -m build -wn
}

check() {
  cd jaraco.envs-$pkgver
  python3.8 -m pytest
}

package() {
  cd jaraco.envs-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
