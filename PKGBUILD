# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-django-q
pkgver=1.3.7
pkgrel=1
pkgdesc='A multiprocessing distributed task queue for Django'
arch=(any)
url=https://github.com/Koed00/django-q
license=(MIT)
depends=(
  python-arrow
  python-blessed
  python-django
  python-django-picklefield
  python-future
  python-six
)
makedepends=(
  git
  python-pip
  python-poetry
)
_tag=d80580dae50ce36c37777bafa5bda9d4815dfbf1
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
