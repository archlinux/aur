# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-polara
_pkgname=${pkgname#python-}
pkgver=0.7.3
pkgrel=1
pkgdesc='Fast and flexible recommender systems framework'
arch=('any')
url='https://github.com/evfro/polara'
license=('MIT')
groups=('recsys')
depends=(
  'python-numba'
  'python-numpy'
  'python-scipy'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
    "python-turicreate: Apple's TuriCreate machine learning library"
    'mymedialite:  Recommender system library for the CLR'
    'python-implicit: Fast Python Collaborative Filtering for Implicit Feedback'
    'python-lightfm: LightFM in Python'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/evfro/polara/archive/refs/heads/develop.tar.gz")
sha256sums=('59818bbac0078668f8914c13312788ec923c0d10fee275b6a64afa0b7fdad931')

prepare() {
    cd "$_pkgname-develop"
    sed -i 's/0.7.2.dev/0.7.3/' setup.py
}

build() {
    cd "$_pkgname-develop"
    python -m build -n -w
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/$_pkgname-develop/dist/$_pkgname-$pkgver-*-*.whl
}
