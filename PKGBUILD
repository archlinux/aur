# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.7.4
pkgrel=2
pkgname=python-scooby
_name=${pkgname#python-}
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('519ab835cd742112bb8e7f6945563507f0acb3da8da645c7057d9c77b195a862d6c29df0d65d22c6d087808f892f2e3667d11ed9bccf75de2d4fef15edd2230a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
