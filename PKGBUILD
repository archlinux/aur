# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apscheduler
pkgver=3.9.1
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
source=("https://github.com/agronholm/apscheduler/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e472805e20f45bb1f13e014e642e92303df15e2dcac388b8255c92cdcd88406ea2970e690029419addd0d2dbede7094b983d4ee4bde1f871d0e9152218ec66eb')

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
