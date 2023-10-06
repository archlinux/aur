# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-dnaio
_module=${pkgname#python-}
pkgver=1.0.1
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
            'cython'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('48cb0a8763d91aee329414f7756ee635dd78f6c059d5dbd0de78fb3b15f8a32a')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
