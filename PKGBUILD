# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=ciphey
_pkgname=Ciphey
pkgver=5.10.0
pkgrel=1
pkgdesc='Automated decryption tool'
arch=('any')
url='https://github.com/Ciphey/Ciphey'
license=('MIT')
depends=(
    'python'
    'python-appdirs'
    'python-base58' #aur
    'python-base91' #aur
    'python-cipheycore' #aur
    'python-cipheydists' #aur
    'python-click'
    'python-click-spinner' #aur
    'python-loguru' #aur
    'python-pybase62' #aur
    'python-pylint'
    'python-pyaml'
    'python-rich'
    'python-yaspin'
)
makedepends=('python-setuptools' 'python-dephell')
provides=('ciphey')
source=(
    "$pkgname.tar.gz::https://codeload.github.com/Ciphey/Ciphey/tar.gz/$pkgver"
)
sha256sums=(
    '3c2cd5e7e4b697d875cc85e4125913c692a8bdf9f34e1791bbef7cd5e9ce5a42'
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
