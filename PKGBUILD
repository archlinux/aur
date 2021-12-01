# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apscheduler
pkgver=3.7.0
pkgrel=2
pkgdesc="In-process task scheduler with Cron-like capabilities"
url="https://github.com/agronholm/apscheduler"
license=('MIT')
arch=('any')
depends=('python-setuptools' 'python-six' 'python-pytz' 'python-tzlocal')
makedepends=('python-setuptools-scm')
checkdepends=('pifpaf' 'python-gevent' 'python-pytest-asyncio' 'python-pytest-cov'
              'python-pytest-tornado' 'python-redis' 'python-sqlalchemy' 'python-tornado'
              'python-twisted' 'redis')
# python-kazoo, python-pymongo removed due to lack of running service
source=("https://github.com/agronholm/apscheduler/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d683267d92c7cf87e998b36c6ae9f4ccaf8321832199b470367008db7c41e04542c5727b2be7f7127d77ee5285dc2d2a09baebafefa3b77d51272b6fe7a4b5e4')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd apscheduler-$pkgver
  python setup.py build
}

check() {
  cd apscheduler-$pkgver
  python setup.py egg_info
  pifpaf run redis -- python -m pytest
}

package() {
  cd apscheduler-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
