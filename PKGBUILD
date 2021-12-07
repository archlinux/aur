# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apscheduler
pkgver=3.8.1
pkgrel=1
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
sha512sums=('0c3c6ca69c9de653b75e762487dc3103f328c37c56772edf8922fae792b00ebfd54afc7b5a01e7db43bf9a23838450bc54c3bf75cb3cc7e14654cce002e0e051')

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
