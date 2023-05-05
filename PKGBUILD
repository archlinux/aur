# Maintainer : bipin kumar <kbipinkumar@pm.me>

pkgname=python-scikit-learn-extra
_module=${pkgname#python-}
pkgver=0.3.0
pkgrel=2
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
            'cython'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7912d43384470d77609e53819d0291967f21010e5c3a3847f9026fc02f9c7893')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/$_module-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
