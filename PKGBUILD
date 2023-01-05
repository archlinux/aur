# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=python-upsetplot
_module=UpSetPlot
pkgver=0.8.0
pkgrel=1
pkgdesc='Python implementation of UpSet plots by Lex et al. doi:10.1109/TVCG.2014.2346248'
arch=(any)
url='https://github.com/jnothman/UpSetPlot'
license=('BSD')
depends=(
        'python' 
        'python-matplotlib'
        'python-pandas'
        'python-seaborn')
makedepends=(
            'python-build'
            'python-installer'
            'python-wheel'
            'python-setuptools-scm'
            'python-pytest-runner'
            )
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d470afe517bd10f3b08f95bba356da4b4f0593bcffdb76e65cdc8c8cd0e3927f')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

