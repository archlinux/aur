# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-django-q
pkgver=1.3.9
pkgrel=5
pkgdesc='A multiprocessing distributed task queue for Django'
arch=(any)
url=https://github.com/Koed00/django-q
license=(MIT)
depends=(
  python-arrow
  python-asgiref
  python-blessed
  python-dateutil
  python-django
  python-django-picklefield
  python-future
  python-pytz
  python-redis
  python-setuptools
  python-six
  python-sqlparse
  python-wcwidth
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
optdepends=(
  'python-boto3: Amazon Simple Queue Service message queue support'
  'python-psutil: resource usage limit support'
  'python-pymongo: MongoDB as a message broker support'
)
_tag=4a8ef8f388b842b916f2ac713383192eec87b8d8
source=(
  git+https://github.com/Koed00/django-q.git#tag=${_tag}
  python-django-q-pep517.patch
)
b2sums=('SKIP'
        '2b95ad47f38f1217d21ad11b5f23a602660880b1d6bcb09716bf8b201987153a360cfabf94d7d3028caa46c9a494bc0716d8d69cf576fe78a5890c9508f88ef5')

prepare() {
  cd django-q
  patch -Np1 -i ../python-django-q-pep517.patch
}

pkgver() {
  cd django-q
  git describe --tags | sed 's/^v//'
}

build() {
  cd django-q
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" django-q/dist/*.whl
  install -Dm 644 django-q/LICENSE -t "${pkgdir}"/usr/share/licenses/python-django-q/
}

# vim: ts=2 sw=2 et:
