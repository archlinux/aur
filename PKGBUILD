# Maintainer: Viliam Tokarcik <viliam@tokarcik.eu>

pkgname=python-django-celery
_pypi_pkgname=django-celery
pkgver=3.1.17
pkgrel=2
pkgdesc="django-celery provides Celery integration for Django"
arch=(any)
url="https://pypi.python.org/pypi/django-celery"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django' 'python-celery')
source=("https://pypi.python.org/packages/source/d/django-celery/django-celery-${pkgver}.tar.gz"
        "fix-schedulers.patch")
md5sums=('a3abc9674b0680469b0694a254dd7019'
         '19bd1c1e12b40373b51563cf901c4ccf')

prepare() {
  cd "$srcdir/$_pypi_pkgname-$pkgver"
  msg2 'Apply patch fix-schedulers.patch'
  patch -p1 -i ../fix-schedulers.patch
}

build() {
  cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
  python setup.py build || return 1
}

package() {
  cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1 || return 1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
