# Maintainer: Klemens Schölhorn <klemens@schoelhorn.eu>

pkgname='python-django-formtools'
pkgver=2.5.1
pkgrel=1
pkgdesc='A set of high-level abstractions for Django forms'
arch=('any')
url="https://github.com/jazzband/django-formtools"
license=('BSD')
depends=('python-django')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
    '0001-Exclude-all-tests-from-wheel.patch' # https://github.com/jazzband/django-formtools/pull/271
)
sha256sums=(
    '8ebd2845691d532a1dac14361da39318af7fac6df1e4a541ac945798ab5ac7cd'
    '23eca9559f3504d65ca799a47c72b75bce7b5a67d06e47db8f915b39152304f0'
)

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
    cd "$srcdir/django-formtools-$pkgver"
    patch --forward --strip=1 --input=../0001-Exclude-all-tests-from-wheel.patch
}

build() {
    cd "$srcdir/django-formtools-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/django-formtools-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
