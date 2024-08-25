# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-isal
_module=${pkgname#python-}
pkgver=1.7.0
pkgrel=2
pkgdesc='Faster zlib and gzip compatible compression and decompression by providing python bindings for the ISA-L library'
arch=('x86_64')
url="https://github.com/pycompression/python-isal"
license=('PSF')
depends=(
         'python'
         'glibc'
        )
makedepends=(
             'python-build'
             'python-installer'
             'python-wheel'
             'python-nose'
             'nasm'
             'python-sphinx'
             'python-sphinx_rtd_theme'
             'python-sphinx-argparse'
             'python-versioningit'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9eb9457ed27fd0a8a7b403a5f4f9e6c8d1a44c2ca28ecd2f2bf3aed90b0a74bf')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
