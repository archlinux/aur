# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>

_pkgname=flower
pkgname=python-$_pkgname
pkgver=1.2.0
pkgrel=1
pkgdesc='Real-time monitor and web admin for Celery distributed task queue'
arch=('any')
url='https://github.com/mher/flower'
license=('BSD')
depends=('python-redis' 'python-humanize' 'python-prometheus_client')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-tornado' 'python-celery')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('974b873cb28deaf5960425fbe4aec7f2abc23653bb2b37d2a56062aa25e2de4d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
