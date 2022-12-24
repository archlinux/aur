# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=python-dnaio
_module='dnaio'
_name=dnaio
pkgver=0.10.0
_pkgver=0.10.0
pkgrel=1
pkgdesc='Python library for very efficient parsing and writing of FASTQ and FASTA files'
arch=('x86_64')
url="https://github.com/marcelm/dnaio/"
license=('MIT')
depends=(
        'python'
        'python-xopen'
        )
makedepends=(
            'python-build'
            'python-installer'
            'python-wheel'
            'python-setuptools'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('de51a50948f00b864297d74eddb588fbee5ac229855754e77564d18b24619d18')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
