# Maintainer: Miodrag Tokić
# Contributor: Yuanji <self@gimo.me>
# Contributor: Aaron Abbott <aabmass at gmail dot com>

pkgname=mycli
pkgver=1.24.2
pkgrel=1
pkgdesc='A Terminal Client for MySQL with AutoCompletion and Syntax Highlighting'
arch=('any')
url='https://github.com/dbcli/mycli'
license=('BSD')
depends=(
    'python'
    'python-click'
    'python-cryptography'
    'python-pygments'
    'python-prompt_toolkit'
    'python-pymysql'
    'python-sqlparse'
    'python-configobj'
    'python-cli_helpers'
    'python-pyperclip'
    'python-pyaes'
)
makedepends=('python-setuptools')
optdepends=('python-paramiko: SSH support')
options=(!emptydirs)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dbcli/mycli/archive/v${pkgver}.tar.gz"
)
sha256sums=(
    '513ed6153297576c648aaa42bc2f5f730301556fd96f063e4dd8671438b1175b'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
