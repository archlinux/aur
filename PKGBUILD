# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-comtypes
_pkgname=comtypes
pkgver=1.5.0
pkgrel=1
pkgdesc='Lightweight pure Python COM package based on the ctypes foreign function interface library; allows you to define, call, and implement custom and dispatch-based COM interfaces.'
arch=('any')
url='https://github.com/enthought/comtypes'
license=('any-OSI')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('34bbdc29e83958863efa4c798811834ad0972b935ec8afc0094c3c1a10a1958d170ec9b6d17abd4b58926743c4bd4ffc403543d7b098afb289770dd4abd1741a')

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

