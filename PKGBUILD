# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-evaluate'
_pkgname=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc='HuggigFace library for easily evaluating machine learning models and datasets'
arch=('x86_64')
url='https://github.com/huggingface/evaluate/'
license=('Apache')
depends=('python-datasets>=2.0.0'
         'python-dill'
         'python-fsspec>=2021.05.0'
         'python-huggingface-hub'
         'python-multiprocess'
         'python-numpy>=1.17'
         'python-pandas'
         'python-requests>=2.19.0'
         'python-scipy>=1.7.1'
         'python-tqdm>=4.62.1'
         'python-xxhash')
makedepends=('python-installer' 'python-packaging' 'python-setuptools')
optdepends=('python-transformers')
groups=('huggingface')
source=("evaluate-${pkgver}.tar.gz::https://github.com/huggingface/evaluate/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9920471c26f2a84a9d3a1ad7c267f1f93bb24722b4f7b8ed7bb801ee314d944e')

build() {
    cd $srcdir/evaluate-$pkgver
    python setup.py bdist_wheel
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*.whl
}
