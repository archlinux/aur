# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-upsetplot
_module=UpSetPlot
pkgver=0.8.2
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
sha256sums=('3d8b0ca0d48589f0fee19d7640f5805ecec76b4c9b4867938cdb23c52ccfedf5')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

