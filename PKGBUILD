# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=python-apscheduler
_name=apscheduler
pkgver=3.11.3
pkgrel=1
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
b2sums=('7d87ec4e56531d4a8f3a7896a7ed378c52ebe28ff62bed30803f990ed532d18bc63de826add4760504d26a071b0689d488acd1e1a8d821026a271a67b270b181')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
