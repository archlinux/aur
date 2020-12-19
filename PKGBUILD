# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-eth-git
pkgver=0.1.2.r1.g19306c9
pkgrel=1
pkgdesc="Ethernet interface modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-eth"
license=('MIT')
depends=('python-cocotb' 'python-cocotbext-axi')
provides=('python-cocotbext-eth')
conflicts=('python-cocotbext-eth')
makedepends=('git' 'python-setuptools')

_gitroot='https://github.com/alexforencich/cocotbext-eth.git'
_gitname='cocotbext-eth'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    python setup.py build
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
