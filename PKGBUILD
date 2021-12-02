# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-django-q
pkgver=1.3.9
pkgrel=4
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
  python-six
  python-sqlparse
  python-wcwidth
)
makedepends=(
  git
  python-pip
  python-poetry
)
optdepends=(
  'python-boto3: Amazon Simple Queue Service message queue support'
  'python-psutil: resource usage limit support'
  'python-pymongo: MongoDB as a message broker support'
)
_tag=4a8ef8f388b842b916f2ac713383192eec87b8d8
source=(git+https://github.com/Koed00/django-q.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd django-q
  git describe --tags | sed 's/^v//'
}

build() {
  cd django-q
  poetry build --format wheel
}

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps django-q/dist/*.whl
  install -Dm 644 django-q/LICENSE -t "${pkgdir}"/usr/share/licenses/python-django-q/
}

# vim: ts=2 sw=2 et:
