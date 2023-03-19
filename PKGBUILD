# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.7.1
pkgrel=4
pkgname=python-scooby
_name=${pkgname#python-}
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        python-version.patch)
sha512sums=('9cbac53dc97de0eb46f4d1cdb7ebc4a7f6a35f2ead234ee8a77aeff728661bfef02971accc8521bcee3de04d9f529e7c02a9664e8de677a5fba1e0256baa490b'
            '46811a25d222bb9c98dbf6a7abb1cbffd81067485886d2469d7dff5b0c1f79380443030021af54ccf8cfcd340570541285d394a81ddb68b5f3617533ff44042f')

prepare() {
    cd "$_name-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/python-version.patch"
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
