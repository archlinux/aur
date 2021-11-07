# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-cocotbext-uart-git
pkgver=0.1.2.r0.gaad6c49
pkgrel=1
pkgdesc="UART modules for cocotb"
arch=('any')
url="https://github.com/alexforencich/cocotbext-uart"
license=('MIT')
depends=('python-cocotb')
provides=('python-cocotbext-uart')
conflicts=('python-cocotbext-uart')
makedepends=('git' 'python-setuptools')

_gitroot='https://github.com/alexforencich/cocotbext-uart.git'
_gitname='cocotbext-uart'

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
