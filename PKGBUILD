# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=python-django-axes
_name=${pkgname#python-}
pkgver=9.0.0
pkgrel=1
pkgdesc='Keep track of failed login attempts in Django-powered sites'
arch=(any)
url="https://github.com/jazzband/django-axes"
license=("MIT")
depends=("python" "python-django")
makedepends=("python-build" "python-installer" "python-setuptools-scm")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e99ca4b6d1531eb4baf8c5315008d799e2cf5e40a96d01f6205307842fd5a746')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_DJANGO_AXES="$pkgver"
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
