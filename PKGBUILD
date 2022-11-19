# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-argparse-cli
pkgname=python38-$_pkgname
pkgver=1.10.0
pkgrel=1
pkgdesc='Render CLI arguments (sub-commands friendly) defined by argparse module'
arch=('any')
url='https://github.com/tox-dev/sphinx-argparse-cli'
license=('MIT')
depends=('python38' 'python38-sphinx' 'python38-docutils-stubs')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel' 'python38-toml')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9ad64f3f4a677e1e24d0f5c23380b6a3ae3050afde9432e4979fc2d7e75cf7e7fe860388aa7253a49e4db6bf46a6fe00f0b5fa3a65ac719a4d5506972f1ea989')

build() {
  cd $_pkgname-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python3.8 -m build -nwx
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH=src pytest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
