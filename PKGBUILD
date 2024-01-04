# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-tueplots
_pkgname=${pkgname#python-}
pkgver=0.0.12
pkgrel=1
pkgdesc='Extend matplotlib for scientific publications'
arch=('any')
url='https://github.com/pnkraemer/tueplots'
license=('MIT')
groups=()
depends=('python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'python-tueplots.diff')
sha256sums=('cd2c395eb98afc28a7a6c3b583cfa8ccc0db377120e543c6b72d6817df79cc15'
            '5c8326c8d9b9d5f1b6e144d40c1fad3c9d9d2c54a9ed018f7e7d4d606d51cd28')

prepare() {
    cd $srcdir/$_pkgname-$pkgver
    patch -strip=1 --input=../python-tueplots.diff
}

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl
}
