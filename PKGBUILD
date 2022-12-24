# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=python-isal
_module='isal'
_name=isal 
pkgver=1.1.0
_pkgver=1.1.0
pkgrel=1
pkgdesc='Faster zlib and gzip compatible compression and decompression by providing python bindings for the ISA-L library'
arch=('x86_64')
url="https://github.com/pycompression/python-isal"
license=('PSF')
depends=(
         'python'
        )
makedepends=(
             'python-build'
             'python-installer'
             'python-wheel'
             'python-nose'
             'yasm'
             'python-sphinx'
             'python-sphinx_rtd_theme'
             'python-sphinx-argparse'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1364f4e3255a57d51c01422ab3ae785a43c076d516ebf49f6a25adecf8232105')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
