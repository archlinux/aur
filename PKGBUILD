# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-django-stubs-ext
_pkgname=django-stubs
pkgver=5.1.1
pkgrel=2
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
sha256sums=('c1cc98a31c4f7bb96ce7d4597211a1edb5222a5a6277a3572105207fc916f0f3')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ext"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ext"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
