# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=python-pytimeparse2
_pyname=${pkgname#python-}
pkgver=1.7.1
pkgrel=1
pkgdesc='Time expression parser'
arch=(any)
url="https://github.com/onegreyonewhite/$_pyname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel} python-setuptools)
checkdepends=(python-nose)
_archive="$_pyname-$pkgver"
source=("https://pypi.python.org/packages/source/p/pytimeparse2/pytimeparse2-${pkgver}.tar.gz")
sha256sums=('98668cdcba4890e1789e432e8ea0059ccf72402f13f5d52be15bdfaeb3a8b253')

build() {
    cd "$_archive"
    python -m build -wn
}

check() {
    cd "$_archive"
    nosetests
}

package() {
    cd "$_archive"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.rst
}
