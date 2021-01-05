# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apscheduler
pkgver=3.6.3
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
sha512sums=('124348e8507deb9561b95544430df9254d8ddb26eb46e0aa7ab56ab8a65b629abd53243367f1a91bd3114e9d99e25e2f80fe8dc6bba19ddeddb5773c335b216b')

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
