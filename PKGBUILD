# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apscheduler
pkgver=3.9.1.post1
_commit=f74a31315a68e9003c5347be35840cf9d0aeddf4
pkgrel=1
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
source=("git+https://github.com/agronholm/apscheduler.git#commit=$_commit")
sha512sums=('SKIP')

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
