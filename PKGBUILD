# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-asyncio
pkgver=0.20.2
pkgrel=1
pkgdesc="Pytest support for asyncio."
arch=('any')
license=('Apache')
url="https://github.com/pytest-dev/pytest-asyncio/"
depends=('python38-pytest')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-flaky' 'python38-hypothesis' 'python38-pytest-trio')
source=("https://github.com/pytest-dev/pytest-asyncio/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5d8b4965cea14dec2a2c7f21f6bb1bad6693b93f07b9dab5c880107a944942bd2c3ef38adc0e17b309222a53afa7504f827baf42201c2a0282a266118e3f7eb7')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-asyncio-$pkgver
  python3.8 -m build -wn
}

check() {
  # Hack entry points by installing it

  cd pytest-asyncio-$pkgver
  python3.8 -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH:$PWD/tests" py.test
}

package() {
  cd pytest-asyncio-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
