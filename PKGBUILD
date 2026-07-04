# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=('python-bbcode')
_pyname=bbcode
pkgver=1.1.0
pkgrel=2
pkgdesc='A pure Python BBCode parser and formatter.'
arch=('any')
url='https://pypi.python.org/pypi/bbcode'
license=('BSD')
depends=('python')
makedepends=('python' 'python-build' 'python-installer' 'python-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('50eb877be1841f11f6407d38f216481b')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

build() {
    cd $_pyname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pyname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
