# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-xdist
pkgver=3.0.2
pkgrel=1
pkgdesc='py.test xdist plugin for distributed testing and loop-on-failing modes'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-xdist'
depends=('python38-execnet' 'python38-pytest')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-filelock' 'python38-psutil')
source=("https://github.com/pytest-dev/pytest-xdist/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fcbc8a6e176e6c7a5523718ce9ab5129f87b0eda5a8e1b818c28f24ae83089d3d5097c8ad7d3a52219a8d2cc7f917b9569dac51712552d463fe920f8eeb867d4')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd pytest-xdist-$pkgver
  python3.8 -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-xdist-$pkgver
  python3.8 -m installer -d "$PWD/tmp_install" dist/*.whl
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-xdist-$pkgver
  python3.8 -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
