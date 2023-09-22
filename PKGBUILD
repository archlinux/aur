# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pyramid-chameleon
pkgver=0.3
pkgrel=1
pkgdesc='Chameleon template compiler for pyramid'
arch=('any')
url='https://github.com/Pylons/pyramid_chameleon'
license=('custom:RPL')
depends=('python-chameleon' 'python-pyramid')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyramid_chameleon/pyramid_chameleon-$pkgver.tar.gz"
        "2c5fb47048d3bff449554fa7fbe3a8b5d51d8d9f.patch"
        "PR34.patch")
sha256sums=('d176792a50eb015d7865b44bd9b24a7bd0489fa9a5cebbd17b9e05048cef9017'
            '0f84122b1737b8593c040fb828517134363e6a517b7e88b961a39703343e7790'
            '5b6c6a2dcac07f682db30a52f5994c1ac8c393b901cbbc60e65fbe051188c6cc')

prepare() {
  cd "pyramid_chameleon-$pkgver"
  patch -p1 < "${srcdir}/2c5fb47048d3bff449554fa7fbe3a8b5d51d8d9f.patch"
  patch -p1 < "${srcdir}/PR34.patch"
}

build() {
  cd "pyramid_chameleon-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "pyramid_chameleon-$pkgver"
  PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "pyramid_chameleon-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
