# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.8.0
pkgrel=1
pkgname=python-scooby
_name=${pkgname#python-}
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('d00b041c57337027c34013fd804bf94417b8b01bed43f5f3f299201b29ac34151a357d70361cf937406bdaabf8092a55c571417c2d973d82173a6629f5a37740')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
