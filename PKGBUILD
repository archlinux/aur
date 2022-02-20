# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python-fudge
pkgver=1.1.1
pkgrel=2
pkgdesc="Use fake objects (mocks, stubs, etc) to test real ones"
arch=(any)
url="http://farmdev.com/projects/fudge/"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-fudge-docs: documentation for Fudge')
source=("https://files.pythonhosted.org/packages/source/f/fudge/fudge-${pkgver}.tar.gz")
md5sums=('3aefdd12c3e0518665fe6735b24a0f9b')

prepare(){
    sed -i '70d' "$srcdir/fudge-$pkgver/setup.py"
}

package() {
  cd "$srcdir/fudge-$pkgver"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
