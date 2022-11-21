# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Andrew Crerar <crerar@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Hideaki Takahashi <mymelo+aur@gmail.com>
# Contributor: Vincent Demeester <vincent@sbr.io>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=python38-docker
pkgver=6.0.1
pkgrel=3
pkgdesc="A Python library for the Docker Engine API"
arch=('any')
url="https://github.com/docker/docker-py"
license=("Apache")
depends=('python38-packaging' 'python38-requests' 'python38-urllib3' 'python38-websocket-client')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('flake8' 'python38-coverage' 'python38-paramiko' 'python38-pytest'
'python38-pytest-cov' 'python38-pytest-timeout')
optdepends=('python38-paramiko: for connections using the SSH protocol')
provides=('python38-docker-py')
conflicts=('python38-docker-py')
replaces=('python38-docker-py')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docker/docker-py/archive/$pkgver.tar.gz")
sha512sums=('86d15c612ce8aeab44559eee476d11f80b41f18c52a77029c5d4ce465ce9ea8bcad0f057c68964318d0d542601e9b5cbdd1297e9c4de0c437bb09d680d8bc8cb')

prepare() {
  sed -i 's/==.*$//' docker-py-"$pkgver"/{,test-}requirements.txt
}

build() {
  cd docker-py-"$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd docker-py-"$pkgver"
  py.test --cov=docker tests/unit
}

package() {
  cd docker-py-"$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
