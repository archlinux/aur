# Maintainer : bipin kumar <bipin@ccmb.res.in>

pkgname=python-scikit-learn-extra
_module=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='Python module for machine learning that extends scikit-learn'
arch=('x86_64')
url="https://github.com/scikit-learn-contrib/scikit-learn-extra"
license=('MIT')
depends=(
        'python'
        'python-scikit-learn'
        'python-matplotlib'
        'python-pytest'
        )
makedepends=(
            'python-build'
            'python-installer' 
            'python-wheel'
            'python-setuptools-scm'
            'python-oldest-supported-numpy'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('3b1bb5fedde47920eb4b3fa0a0c18f80cc7359d9d0496720178788c6153b8019')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
