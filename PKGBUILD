# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=python-xdgenvpy
_name=${pkgname//python-}
pkgver=2.3.5
pkgrel=1
pkgdesc="Another XDG Base Directory Specification utility."
arch=('any')
url="https://gitlab.com/deliberist/xdgenvpy"
license=('MIT')
makedepends=('python-setuptools' 'python-wheel' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('31e6c2ba68061000d09f74444db0520da90d2fb694a3b2c23551b06ac8d9642f')

build() {
    cd $_name-$pkgver
    pip3 freeze > requirements.txt
    pip3 freeze > requirements-test.txt
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
