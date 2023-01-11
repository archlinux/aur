# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=python-xlmhg
_name=xlmhg
pkgver=2.5.4
pkgrel=2
pkgdesc='Efficient Python implementation of the semiparametric XL-mHG test for enrichment'
arch=(x86_64)
url=https://github.com/flo-compbio/xlmhg
license=(BSD)
depends=(
         'python'
         'cython'
         'python-numpy'
         'python-plotly'
        )
makedepends=(
             'python-pip'
             'python-setuptools'
             'python-setuptools-scm'
             'python-sphinx'
            )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'xlmhg.patch.tar.gz')
sha256sums=('3d6764ff16f8eea8522a094cfa119b80ebe4a7c23ae75f2111d0a8306ddd4e57'
            '7d078876c97f4028f3bbfed53cac324b9eeb21640720b5695d7f77b8039c1c5c')

prepare() {
    patch -p0 < xlmhg.patch
}

build() {
    cd "$srcdir/${_name}-${pkgver}"
     python setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

