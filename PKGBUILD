# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-celery
pkgver=0.0.0a1
pkgrel=3
pkgdesc='A shim pytest plugin to enable celery.contrib.pytest'
arch=('any')
license=('BSD')
url='https://github.com/celery/pytest-celery'
depends=('python-celery')
makedepends=('python-dephell')
source=("https://pypi.io/packages/source/p/pytest-celery/pytest-celery-$pkgver.tar.gz")
sha512sums=('ea8ef26aaa5dd5c04608cb01bedb4946bb6712d08203e5f9b1b9b2b1a9e49e7a550466d7a9dd896fb5d813960cee35eed139099952589cdf21e03dadd7e2a20f')

prepare() {
  cd pytest-celery-$pkgver

  # poetry-generated setup.py is badly broken in several ways, including
  # distribution of tests in the built package as well as using distutils for
  # bad metadata. See https://github.com/sdispater/poetry/issues/866
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd pytest-celery-$pkgver
  python setup.py build
}

package() {
  cd pytest-celery-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
