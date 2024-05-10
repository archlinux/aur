# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apscheduler
pkgver=3.10.4
pkgrel=2
pkgdesc="In-process task scheduler with Cron-like capabilities"
url="https://github.com/agronholm/apscheduler"
license=('MIT')
arch=('any')
depends=('python-setuptools' 'python-six' 'python-pytz' 'python-tzlocal')
makedepends=('git' 'python-setuptools-scm')
checkdepends=('pifpaf' 'python-gevent' 'python-pytest-asyncio' 'python-pytest-cov'
              'python-pytest-tornado' 'python-redis' 'python-sqlalchemy' 'python-tornado'
              'python-twisted' 'redis')
# python-kazoo, python-pymongo removed due to lack of running service
source=("git+https://github.com/agronholm/apscheduler.git#tag=$pkgver")
sha512sums=('c2b5648f8696afcc5413734de069977346a9c9adbb59a9889fd38cc0c9aa827e25977b7a3bef390f700a65ad4bdc31aaa49d469bfdeda66523adb9accf7c6b63')

build() {
  cd apscheduler
  python setup.py build
}

check() {
  cd apscheduler
  python setup.py egg_info
  pifpaf run redis -- python -m pytest
}

package() {
  cd apscheduler
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
