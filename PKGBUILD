# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_pkgname=updog
pkgname=python-$_pkgname
pkgver=1.4
pkgrel=1
pkgdesc="A replacement for Python's SimpleHTTPServer"
arch=('any')
url="https://github.com/sc0tfree/$_pkgname"
license=('MIT')
depends=('python-colorama' 'python-flask-httpauth' 'python-pyopenssl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/sc0tfree/$_pkgname/$pkgver/LICENSE")
sha256sums=('ee7fdd76317a789925a3e4fbf7eff3071487af279b7365bd831c31b1bd816c5e'
            '1a3b687e7222eeae4b34cce466e1ad8a4df68c81ce51d4a30910ecc91d726a66')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
