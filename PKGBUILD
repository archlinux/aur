# Maintainer: Chris Gorman <chrisjohgorman@gmail.com>

pkgname=python-sigmf
_name=${pkgname#python-}
pkgver=1.1.5
_commit=175109c26b5e539b0f2392345fa694068f499742
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
