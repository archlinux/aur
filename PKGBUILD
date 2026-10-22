# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=python-fitdecode
_name=fitdecode
pkgdesc='FIT file parser and decoder'
pkgver=0.11.0
pkgrel=1
url="https://github.com/polyvertex/$_name"
arch=('any')
license=('MIT')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
depends=('python')
checkdepends=('python-pytest')
source=("$pkgname"-"$pkgver".tar.gz::"$url"/archive/refs/tags/v"$pkgver".tar.gz)
sha256sums=('9e83af4c0ba2947550cc41b49129d388c9a21dbeab8781c8fe59ceb49d22a811')

build()
{
    cd "$srcdir"/"$_name"-"$pkgver"
    python -m build --wheel --no-isolation
}

check()
{
    cd "$srcdir"/"$_name"-"$pkgver"
    python -m pytest tests
}

package()
{
    cd "$srcdir"/"$_name"-"$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.txt
    install -Dm644 README.rst "$pkgdir"/usr/share/doc/"$pkgname"/README.rst
}
