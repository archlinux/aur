# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=python-django-axes
_name=${pkgname#python-}
pkgver=8.3.2
pkgrel=2
pkgdesc='Keep track of failed login attempts in Django-powered sites'
arch=(any)
url="https://github.com/jazzband/django-axes"
license=("MIT")
depends=("python" "python-django")
makedepends=("python-build" "python-installer" "python-setuptools-scm")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('40c697a86020f866e5086f41142cd9fb6effadd78faa4389468ebfcc9150ed2c')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_DJANGO_AXES="$pkgver"
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
