# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-ttpy
_pkgname=${pkgname#python-}
pkgver=1.2.0
_pkgver=a50d5e0ce2a033a4b1aa703715cb85d715b9b34a
pkgrel=1
pkgdesc='Python implementation of the TT-Toolbox'
arch=('any')
url='https://github.com/oseledets/ttpy'
license=('Apache')
groups=()
depends=('python-numpy' 'python-scipy' 'python-six')
makedepends=('cython' 'gcc-fortran' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/oseledets/$_pkgname/archive/$_pkgver.tar.gz"
        'tt-fort.tar.gz::https://github.com/oseledets/tt-fort/archive/refs/heads/master.tar.gz'
        'rectcross.tar.gz::https://bitbucket.org/oseledets/rectcross/get/528b68551db0.tar.gz'
        'rect-maxvol.tar.gz::https://bitbucket.org/muxas/rect_maxvol/get/ddfbe3d6c69c.tar.gz'
)
sha256sums=('e51b2fc912028d4d10ccfe964cba2ccf885042332383402ec016a136a84b799e'
            'bb2bb02a829f1213879878efab376c5ca7850a87992f064751e68fda9eee13ad'
            '1b976843c07a4551da2d8e5e925045498133c4775dba457ff7303a944f5af518'
            '234e02c39e0e22a5649c1413837c550e173b7f8e35d9ba96c62b9e0d0d5e2148')

prepare() {
    rm -rf $_pkgname-$_pkgver/tt/tt-fort
    rm -rf $_pkgname-$_pkgver/tt/cross/rectcross
    rm -rf $_pkgname-$_pkgver/tt/utils/rect_maxvol

    ln -fs $srcdir/$_pkgname-$_pkgver ttpy
    ln -fs $srcdir/tt-fort-master $_pkgname-$_pkgver/tt/tt-fort
    ln -fs $srcdir/oseledets-rectcross-528b68551db0 $_pkgname-$_pkgver/tt/cross/rectcross
    ln -fs $srcdir/muxas-rect_maxvol-ddfbe3d6c69c $_pkgname-$_pkgver/tt/utils/rect_maxvol
}

build() {
    python -m build -nw $_pkgname-$_pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$_pkgver/dist/ttpy-*.whl
}
