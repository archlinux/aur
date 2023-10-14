# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-isal
_module=${pkgname#python-}
pkgver=1.5.0
pkgrel=2
pkgdesc='Faster zlib and gzip compatible compression and decompression by providing python bindings for the ISA-L library'
arch=('x86_64')
url="https://github.com/pycompression/python-isal"
license=('PSF')

depends=('python' 'glibc')
        
makedepends=(
             'python-build'
             'python-installer'
             'python-wheel'
             'python-nose'
             'nasm'
             'python-sphinx'
             'python-sphinx_rtd_theme'
             'python-sphinx-argparse'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('eadb48eb7dc161ac73afe36b18980b3b34ac224f2172302e301717aa40748b54')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
