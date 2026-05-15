# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-django-stubs-ext
_pkgname=django-stubs
pkgver=5.2.9
pkgrel=1
pkgdesc="Extensions and monkey-patching for django-stubs."
arch=('any')
url="https://github.com/typeddjango/django-stubs"
license=('MIT')
depends=(python-django)
makedepends=(python-build
	         python-installer
	         python-setuptools
             python-uv-build
	         python-wheel)
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('a246dea4fff8c8879ba51ce99c246696312d45bf749a8c4050322f6d6f886c59')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ext"
    python -m build --wheel
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ext"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
