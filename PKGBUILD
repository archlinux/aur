# Maintainer: Chris Gorman <chrisjohgorman@gmail.com>

pkgname=python-sigmf
_name=${pkgname#python-}
pkgver=1.1.3
_commit=c5aa8f30dcfa08596ffa70744422b6e4a95c4300
pkgrel=1
pkgdesc='Python package for Signal Metadata Format (SigMF)'
url='https://github.com/sigmf/sigmf-python'
license=('LGPL3')
arch=('any')
depends=('python' 'python-jsonschema' 'python-numpy' 'python-pysimplegui')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname::git+$url.git#commit=$_commit")
sha512sums=('SKIP')

build() {
    ln -s "${pkgname}" "$_name-$pkgver"
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
