# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=ciphey
_pkgname=Ciphey
pkgver=5.14.0
pkgrel=1
pkgdesc='Automated decryption tool'
arch=('any')
url='https://github.com/Ciphey/Ciphey'
license=('MIT')
depends=(
    'flake8'
    'python'
    'python-appdirs'
    'python-base58' #aur
    'python-base91' #aur
    'python-cipheycore' #aur
    'python-cipheydists' #aur
    'python-click'
    'python-mock'
    'python-pyaml'
    'python-pybase62' #aur
    'python-pylint'
    'python-pywhat' #aur
    'python-rich'
    'python-typing_inspect'
)
makedepends=('python-setuptools' 'python-dephell')
provides=('ciphey')
source=(
    "$pkgname.tar.gz::https://codeload.github.com/Ciphey/Ciphey/tar.gz/$pkgver"
)
sha256sums=(
    '42fd5ea5b462ab37cb2e6aed41c254e7ed44bb190fed9a3918e6bdd56d86e10f'
)

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root=$pkgdir --optimize=1 --skip-build
    install -Dm644 license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
