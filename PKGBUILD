# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgname=python3-django-tagging
_pkgname=django-tagging
pkgver=0.5.0
pkgrel=6
pkgdesc="A generic tagging application for Django projects in python3"
arch=('any')
url='https://pypi.python.org/pypi/django-tagging'
license=('MIT')
depends=('python-django')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/d2/9b/a137d764eb990ac353399d244aa96c7cf02aabe3c58be5a74418406bb838/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('28d68fa4831705e51ad7d1e845ed6dd9e354f9b6f8a5f63b655a430646ef4e8d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's/smart_text/smart_str/g' tagging/models.py
  python -m build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
