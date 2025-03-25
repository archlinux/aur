# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# shellcheck disable=SC2034,SC2154

pkgname=python-pymbar
_name=${pkgname#python-}
pkgdesc='Python implementation of the multistate Bennett acceptance ratio (MBAR) method'
pkgver=4.0.3
pkgrel=1
url="https://github.com/choderalab/pymbar"
arch=('any')
license=('MIT')
depends=(
    'python'
    'python-matplotlib'
    'python-numpy'
    'python-pytest'
    'python-scikit-learn'
    'python-scipy'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=('d93f3bfe7f81d8855903db40ddba0d82f235d6b4c6f416f72da3d2af00751a1a7d1d32eabda0e1a5d0163010ecb06f77a4ab4f4d97db724240e65733e661ff77')

build() {
    cd "$_name-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/python-pymbar/LICENSE"
}
