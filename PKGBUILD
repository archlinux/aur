# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-clipspy
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc="CLIPS Python bindings"
arch=('x86_64')
url="https://github.com/noxdafox/clipspy"
license=('BSD')
makedepends=('python-setuptools')
depends=('clips-lib' 'python-cffi')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('25bf864e01f35c2ed4d0e3f3963e0a800e2e773f428dce8fd565028f46116d26')

build() {
    cd "$_name-$pkgver"
    python setup.py build_ext --include-dirs="/usr/include/clips"
    python setup.py sdist bdist_wheel
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
