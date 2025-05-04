# Maintainer: Max Beikirch <max.beikirch@unitybox.de>
# blueprint: python-scikit-learn-extra

pkgname=python-scikit_survival
_module=${pkgname#python-}
pkgver=0.24.1
pkgrel=2
pkgdesc='Survival analysis built on top of scikit-learn'
arch=('x86_64')
url='https://github.com/sebp/scikit-survival'
license=('GPL-3.0-or-later')
depends=(
        'python'
        'python-scikit-learn'
        'python-ecos'
        'python-joblib'
        'python-numexpr'
        'python-numpy'
        'python-osqp'
        'python-pandas'
        'python-scipy'
        'python-pytest'
        # as proposed by namcap
        'glibc'
        'gcc-libs'
        )
makedepends=(
            'python-build'
            'python-installer'
            'python-wheel'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('059ca5911f980e44f69951baf08efc8d7a7cf1adba7a5422580ef65330cfd88e')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
