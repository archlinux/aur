# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-django-static-precompiler
_name=${pkgname#python-}
pkgver=2.4
pkgrel=1
pkgdesc="Django template tags to compile all kinds of static files"
arch=('any')
url="https://github.com/andreyfedoseev/django-static-precompiler"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-django')
optdepends=('python-libsass'
	'python-watchdog')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('22c983f4318f4ad96645d8b71af5c29d4525e55d0d5c3abe8917310280c7f89e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
