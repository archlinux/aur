# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-django-stubs-ext
_pkgname=django-stubs
pkgver=5.1.3
pkgrel=1
pkgdesc="Extensions and monkey-patching for django-stubs."
arch=('any')
url="https://github.com/typeddjango/django-stubs"
license=('MIT')
depends=(python-django)
makedepends=(python-build
	     python-installer
	     python-setuptools
	     python-wheel)
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('973155c0930c385a15a54d06df15188e1c787b21f99f18fa7c4a7d08c44a265a')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ext"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ext"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
