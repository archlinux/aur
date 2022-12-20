# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=python-xopen
_module=xopen
_name=xopen
pkgver=1.7.0
_pkgver=1.7.0
pkgrel=1
pkgdesc='Python library to open compressed files transparently'
arch=('x86_64')
url="https://github.com/pycompression/xopen/"
license=('MIT')
depends=(
        'python'
        'pigz'
        'python-isal'
        )
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('901f9c8298e95ed74767a4bd76d9f4cf71d8de27b8cf296ac3e7bc1c11520d9f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
