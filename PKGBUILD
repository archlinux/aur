# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-dnaio
_module=${pkgname#python-}
pkgver=1.0.0
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
sha256sums=('528a5dc409f29eed947a1c86f2043bed3e8a72c1fe4f8426a8b5ab59aeaa0155')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
