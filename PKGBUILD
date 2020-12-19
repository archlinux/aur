# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-axi-git
pkgver=0.1.4.r1.g4336c32
pkgrel=1
pkgdesc="AXI, AXI lite, and AXI stream modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-axi"
license=('MIT')
depends=('python-cocotb')
provides=('python-cocotbext-axi')
conflicts=('python-cocotbext-axi')
makedepends=('git' 'python-setuptools')

_gitroot='https://github.com/alexforencich/cocotbext-axi.git'
_gitname='cocotbext-axi'

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
