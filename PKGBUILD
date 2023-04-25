# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=aiohttp-apispec
pkgname=python-$_pkgname
pkgver=2.2.3
pkgrel=4
pkgdesc='Build and document REST APIs with aiohttp and apispec'
arch=('any')
url='https://github.com/maximdanilchenko/aiohttp-apispec'
license=('MIT')
depends=('python-aiohttp' 'python-apispec' 'python-webargs' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-pip' 'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest-runner' 'python-pytest-aiohttp' 'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
         3b4d08ea.patch)
sha512sums=('846c92ce213c2f7165710be0f080fe8fb7c43c3fb4708f80aed3b5cc4c8dc78abf4dc4abbe63edfc8e3f634cdfa0bf7aeabb2a92129a2078d0e2e41680900c73'
            '8f148e0b403e3501b7d78041d1e110a87b7b8bfa574f7030d060605af2d369f86a1cbdbc4880e24faf608d0703c7c7abae787db459bbc05a92ee23385879c4a9')

prepare() {
  patch -d $_pkgname-$pkgver -p1 < 3b4d08ea.patch # Fix tests
}

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  python setup.py pytest
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
