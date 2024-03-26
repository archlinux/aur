# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=python-xopen
_module=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc='Python library to pen compressed files transparently'
arch=('any')
url="https://github.com/pycompression/xopen/"
license=('MIT')
depends=(
        'python'
        'python-typing_extensions'
        'python-zstandard'
        'python-isal'
        )
makedepends=(
            'python-build'
            'python-installer'
            'python-wheel'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('201b30809144235582c092910fda531ec156cb7469905b00cbdd64e5282191e3')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
