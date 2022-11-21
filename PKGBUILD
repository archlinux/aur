# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_pkgname=tqdm
pkgname=python38-$_pkgname
pkgver=4.64.1
pkgrel=1
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL')
url='https://github.com/tqdm/tqdm'
depends=('python38')
optdepends=('python38-requests: telegram')
makedepends=('python38-setuptools-scm' 'python38-toml')
checkdepends=('python38-pytest' 'python38-pytest-asyncio' 'python38-pytest-timeout' 'python38-numpy'
              'python38-pandas' 'python38-tensorflow' 'python38-rich' 'python38-dask' 'tk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tqdm/tqdm/archive/v$pkgver.tar.gz")
sha512sums=('87cb0c0daebb66ccdbf6f55207459795fcaa93d9bfacb767008ca9e536c0e2738c3639162d02fd0b9d91b18a75b411d5a0d53feb7d6c4786be31640c35a8d9b5')

build() {
  cd $_pkgname-$pkgver

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  python3.8 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  python3.8 -m venv --system-site-packages test-env

  test-env/bin/python setup.py install
  test-env/bin/python -m pytest -k 'not test_dask'
}

package() {
  cd $_pkgname-$pkgver

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}

# vim:set ts=2 sw=2 et:
