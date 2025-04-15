# Maintainer: Chris Gorman <chrisjohgorman@gmail.com>

pkgname=python-sigmf
_name=${pkgname#python-}
pkgver=1.2.9
_commit=d4031c0aef65bb08abf55fe0714f41f5e80c55a5
pkgrel=1
pkgdesc='Python package for Signal Metadata Format (SigMF)'
url='https://github.com/sigmf/sigmf-python'
license=('LGPL3')
arch=('any')
depends=('python' 'python-jsonschema' 'python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("$pkgname::git+$url.git#commit=$_commit"
        0001-packages-sigmf.apps.patch)
sha512sums=('4d19a70eff9e2c18b0f86fabd626eb4785ff5fe5ec8bbcfe72a1568b81fd1d8a20b98e448ecdf6713feb7234c44a3d332b63aa364ba10a01d60404e710a3d3f0'
            'a32af33497db9dc75684ba584833c58b9a8751c17335bbdf7c6defbd79078926f8beab0645396711f9a74279b5bc869de0f5cc92651173666b093daf8fe17be8')

prepare() {
    cd "${pkgname}"
    patch -Np1 -i ../0001-packages-sigmf.apps.patch
}

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
