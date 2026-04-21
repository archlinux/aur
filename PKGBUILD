# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=python-apscheduler
_name=apscheduler
pkgver=3.11.2
pkgrel=2
pkgdesc="In-process task scheduler with Cron-like capabilities"
url="https://github.com/agronholm/apscheduler"
license=('MIT')
arch=('any')
depends=('python-setuptools' 'python-six' 'python-pytz' 'python-tzlocal')
makedepends=("python-build" "python-packaging" "python-wheel" "python-installer" "python-setuptools-scm")
optdepends=(
  'python-twisted: For schedulers/twisted'
  'python-tornado: For schedulers/tornado'
  'python-gevent: For schedulers/gevent'
  'python-sqlalchemy: For jobstores/sqlalchemy'
  'python-kazoo: For jobstores/zookeeper'
  'python-pymongo: For jobstores/mongo'
  'python-redis: For jobstores/redis'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('4278a2630acfcfd504134c8783610ac532ec4beae17c84c726c32fbb4b5d82886fd2bfd4f79939cd04ebbaa3da27e1a6e6b2ed0ede79750c9d8827e5be7c942f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
