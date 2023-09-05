# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-clipspy
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="CLIPS Python bindings"
arch=('x86_64')
url="https://github.com/noxdafox/clipspy"
license=('BSD')
makedepends=('python-setuptools')
depends=('clips-lib' 'python-cffi')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c1744577cbd2ab1e2b05004be6409604d7a70841197f6b4737ad9ef9dd1d949c')

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