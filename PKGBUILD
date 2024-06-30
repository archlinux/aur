# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-xlmhglite
_module=${pkgname#python-}
pkgver=1.1.1
pkgrel=1
pkgdesc='A minimal fork of the original python-xlmhg package'
arch=('x86_64')
url="https://github.com/GuyTeichman/xlmhglite"
license=(custom:BSD-3)
depends=(
         'python'
         'cython'
         'glibc'
         'python-numpy'
         'python-plotly'
         'python-pandas'
         'python-scipy'
         'python')

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
sha256sums=('01855fd1f6664d0ecdaa7d02c3ad9db15343192bfcd550f98ac3f8833fe74d49')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
